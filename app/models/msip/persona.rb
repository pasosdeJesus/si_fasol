# frozen_string_literal: true

require "jos19/concerns/models/persona"

module Msip
  class Persona < ActiveRecord::Base
    include Jos19::Concerns::Models::Persona

    has_many :aporte,
      foreign_key: "persona_id",
      validate: true,
      dependent: :destroy,
      class_name: "::Aporte",
      inverse_of: :persona

    accepts_nested_attributes_for :aporte,
      allow_destroy: true,
      reject_if: :all_blank

    belongs_to :tipoaliado,
      validate: true,
      class_name: "::Tipoaliado",
      foreign_key: "tipoaliado_id",
      optional: true

    belongs_to :ultimo_departamento_trabajo,
      validate: true,
      class_name: "Msip::Departamento",
      foreign_key: "ultimo_departamento_trabajo_id",
      optional: true

    belongs_to :ultima_regionpago,
      validate: true,
      class_name: "::Regionpago",
      foreign_key: "ultima_regionpago_id",
      optional: true

    belongs_to :ultimo_cargoestado,
      validate: true,
      class_name: "::Cargoestado",
      foreign_key: "ultimo_cargoestado_id",
      optional: true

    belongs_to :ultima_entidad,
      validate: true,
      class_name: "Msip::Orgsocial",
      foreign_key: "ultima_entidad_id",
      optional: true

    attr_accessor :am_año, :am_mes  # Para actualizacion masiva

    validates :detallealiado, length: { maximum: 1000 }

    validates :tdocumento_id, presence: true, allow_blank: false
    validates :numerodocumento, presence: true, allow_blank: false,
      uniqueness: { scope: :tdocumento,
                    message: "Tipo y número de documento repetido"
      }

    validate :sindoc_estandar
    def sindoc_estandar
      if tdocumento_id == 11
        if tdocumento_id == 11 && id && numerodocumento &&
            numerodocumento.to_s != '' &&
            numerodocumento.to_i != self.id &&
            (numerodocumento[-1] < 'A' || numerodocumento[-1] > 'Z')
          errors.add(:numerodocumento, "Número de documento #{numerodocumento} "\
                     "con tipo SIN DOCUMENTO  debe ser el "\
                     "número de la persona (i.e #{self.id}) o "\
                     "un número seguido de letras (e.g 2190C)")
        end
      end
    end

    validate :sin_aportes_tras_desafiliacion
    def sin_aportes_tras_desafiliacion
      if !self.fecha_desafiliacion_aportante
        return
      end
      aporte.each do |a|
        if (a.anio && a.mes &&
            a.anio > self.fecha_desafiliacion_aportante.year ||
            (a.anio == self.fecha_desafiliacion_aportante.year &&
             a.mes > self.fecha_desafiliacion_aportante.month))
          errors.add(:fecha_desafiliacion_aportante,
                     "No puede haber aportes posteriores a la "\
                     "fecha de deshabilitación como #{a.mes}/#{a.anio}")
        end
      end
    end

    def nombres=(valc)
      self[:nombres] = valc.to_s.upcase.
        sub(/  */, ' ').sub(/^  */, '').sub(/  *$/, '')
    end

    def apellidos=(valc)
      self[:apellidos] = valc.to_s.upcase.
        sub(/  */, ' ').sub(/^  */, '').sub(/  *$/, '')
    end

    scope :filtro_actividad_ids, lambda {|o| 
      if o.upcase.strip == "SI"
        where(
          "id in (SELECT persona_id FROM cor1440_gen_asistencia)"
        )
      elsif o.upcase.strip == "NO"
        where.not(
          "id in (SELECT persona_id FROM cor1440_gen_asistencia)"
        )
      end
    }

    scope :filtro_aportes , lambda {|a|
        where(
          "id in (SELECT persona_id FROM (
                SELECT persona_id, SUM(valor) AS aportes FROM aporte
                  GROUP BY 1 ORDER BY 1
              ) AS s WHERE s.aportes = ?)", a)
    }
 
    scope :filtro_familiarvictima_ids, lambda {|o| 
      if o.upcase.strip == "SI"
        where(
          "id in (SELECT persona2 "\
          "  FROM msip_persona_trelacion "\
          "  WHERE persona1 IN (SELECT persona_id FROM sivel2_gen_victima))"
        )
      elsif o.upcase.strip == "NO"
        where.not(
          "id in (SELECT persona2 "\
          "  FROM msip_persona_trelacion "\
          "  WHERE persona1 IN (SELECT persona_id FROM sivel2_gen_victima))"
        )
      end
    }

    scope :filtro_caso_ids, lambda {|o| 
      if o.upcase.strip == "SI"
        where(
          "id in (SELECT persona_id FROM sivel2_gen_victima)"
        )
      elsif o.upcase.strip == "NO"
        where.not(
          "id in (SELECT persona_id FROM sivel2_gen_victima)"
        )
      end
    }

    scope :filtro_tipoaliado_id, lambda {|tid|
      where(tipoaliado_id: tid.to_i)
    }

    scope :filtro_ultimo_aporte, lambda {|uap|
      if uap == "Desafiliado"
        where("fecha_desafiliacion_aportante IS NOT NULL")
      elsif uap == "No aportante"
        where("id NOT IN (SELECT persona_id FROM aporte WHERE valor>0)")
      elsif uap != ""
        where(
          "id IN (SELECT persona_id FROM aporte 
            WHERE valor=? AND 
            (persona_id, anio, mes) IN (
              SELECT persona_id, anio as maxanio, max(mes) AS maxmes 
                FROM aporte WHERE valor>0 AND (persona_id, anio) IN (
                  SELECT persona_id, MAX(anio) FROM aporte WHERE valor>0 
                    GROUP BY 1 ORDER BY 1) 
                  GROUP BY 1,2 ORDER by 1,2
              )
            )", uap.to_i)
      end
    }

    # Registros msip_persona_trelacion en los que
    # esta persona aparece como persona2 y la
    # persona1 es víctima en un caso
    def como_familiar_de_victima
      persona_trelacion2.where(
        "msip_persona_trelacion.persona1 IN "\
          "(SELECT persona_id FROM sivel2_gen_victima)",
      ).order(
        :persona1,
      )
    end

    def ultimo_aporte
      if self.fecha_desafiliacion_aportante
        return "Desafiliado"
      end
      if aporte.where("valor > 0").count == 0
        return "No aportante"
      end
      ultimo = aporte.where("valor > 0").
        order(["anio desc", "mes desc"]).first
      return ultimo.valor.a_decimal_localizado + " en " + 
        ultimo.anio.to_s + "-" + ultimo.mes.to_s.rjust(2, '0')
    end

    def nombres_y_apellidos
      r = nombres.strip + " " + apellidos.strip
      r.strip
    end

    def añoanterior
      return Date.today.year-1
    end

    def aporte_enero_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 1).take
      return v ? v.valor : nil;
    end

    def aporte_febrero_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 2).take
      return v ? v.valor : nil;
    end

    def aporte_marzo_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 3).take
      return v ? v.valor : nil;
    end

    def aporte_abril_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 4).take
      return v ? v.valor : nil;
    end

    def aporte_mayo_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 5).take
      return v ? v.valor : nil;
    end

    def aporte_junio_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 6).take
      return v ? v.valor : nil;
    end

    def aporte_julio_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 7).take
      return v ? v.valor : nil;
    end

    def aporte_agosto_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 8).take
      return v ? v.valor : nil;
    end

    def aporte_septiembre_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 9).take
      return v ? v.valor : nil;
    end

    def aporte_octubre_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 10).take
      return v ? v.valor : nil;
    end

    def aporte_noviembre_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 11).take
      return v ? v.valor : nil;
    end

    def aporte_diciembre_añoanterior
      v = self.aporte.where(anio: añoanterior).where(mes: 12).take
      return v ? v.valor : nil;
    end

    def aporte_total_añoanterior
      v = self.aporte.where(anio: añoanterior).sum(:valor)
      return v
    end

    def fechaactual
      return Date.today.to_s
    end
  end
end
