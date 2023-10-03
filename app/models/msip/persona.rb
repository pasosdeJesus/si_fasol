# frozen_string_literal: true

require "jos19/concerns/models/persona"

module Msip
  class Persona < ActiveRecord::Base
    include Jos19::Concerns::Models::Persona

    has_many :aporte,
      foreign_key: "persona_id", 
      validate: true,
      dependent: :destroy,
      class_name: "::Aporte"
    accepts_nested_attributes_for :aporte,
      allow_destroy: true, 
      reject_if: :all_blank

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

    def proximo_aporte
      if self.fecha_desafiliacion_aportante
        return "Desafiliado"
      end
      if aporte.where("valor > 0").count == 0
        return "No aportante"
      end
      ultimo = aporte.where("valor > 0").
        order(["anio desc", "mes desc"]).first
      return ultimo.valor.a_decimal_localizado
    end

  end
end
