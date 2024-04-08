# frozen_string_literal: true

require "jos19/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Msip::Persona

    include Jos19::Concerns::Controllers::PersonasController

    def atributos_show
      [
        :id,
        :nombres,
        :apellidos,
        :tdocumento_id,
        :numerodocumento,
        :anionac,
        :mesnac,
        :dianac,
        :sexo,
        :etnia,
        :pais_id,
        :departamento_id,
        :municipio_id,
        :centropoblado_id,
        :nacionalde,
        :familiares,
        :ultimo_departamento_trabajo_id,
        :ultima_regionpago_id,
        :ultimo_correo_trabajo,
        :ultimo_celular_trabajo,
        :ultima_entidad_id,
        :ultimo_cargoestado_id,
        :actividad_ids,
        :caso_ids,
        :familiarvictima_ids,
        :tipoaliado_id,
        :detallealiado,
        :ultimo_aporte,
        :aportes,
        :fecha_desafiliacion_aportante,
        :etiqueta_ids,
      ]
    end

    def atributos_form
      a = atributos_show  - [
        :actividad_ids,
        :caso_ids,
        :familiarvictima_ids,
        :ultimo_aporte
      ]
      a[a.index(:familiares)] = :persona_trelacion1
      return a
    end 

    def atributos_index
      [
        :id,
        :nombres,
        :apellidos,
        :tdocumento_id,
        :numerodocumento,
        :anionac,
        :mesnac,
        :dianac,
        :sexo,
        :pais,
        :departamento,
        :municipio,
        :centropoblado,
        :nacionalde,
        :etiqueta_ids,
        :actividad_ids,
        :caso_ids,
        :familiarvictima_ids,
        :tipoaliado_id,
        :ultimo_aporte,
        :aportes,
      ]
    end

    def index_reordenar(c)
      c.reorder([:nombres, :apellidos])
    end

    def vistas_manejadas
      ['Persona']
    end

    def destroy
      if Sivel2Gen::Victima.where(persona_id: @registro.id).count == 0
        Msip::PersonaTrelacion.where(persona1: @registro.id).delete_all
        Msip::PersonaTrelacion.where(persona2: @registro.id).delete_all
      end
      destroy_gen
    end

    def registrar_en_bitacora
      true
    end

    def actualizacion_masiva
      render layout: 'application'
    end

    def hacer_actualizacion_masiva
      if !params || !params[:persona] || !params[:persona][:am_año] ||
          params[:persona][:am_año].to_i < 2020  ||
          params[:persona][:am_año].to_i > Date.today.year
        return
      end
      if !params[:persona][:am_mes] ||
          params[:persona][:am_mes].to_i < 0  ||
          params[:persona][:am_mes].to_i > 11
        return
      end
      am_año = params[:persona][:am_año].to_i
      am_mes = 1 + params[:persona][:am_mes].to_i

      añoa = am_mes == 1 ? am_año - 1 : am_año
      mesa = am_mes == 1 ? 12 : am_mes - 1
      cons = "SELECT persona_id, #{am_año}, #{am_mes}, valor FROM aporte "\
        "WHERE anio=#{añoa} AND mes=#{mesa} AND valor>0 "\
        "AND persona_id NOT IN (SELECT id FROM msip_persona "\
        "  WHERE fecha_desafiliacion_aportante < '#{añoa}-#{mesa}-01')"\
        "AND persona_id NOT IN (SELECT persona_id FROM aporte"\
        "  WHERE anio=#{am_año} AND mes=#{am_mes})"
      ins = "INSERT INTO aporte (persona_id, anio, mes, valor) (#{cons});"
      puts ins
      c_ultid = Aporte.connection.execute <<-SQL
        SELECT last_value FROM aporte_id_seq;
      SQL
      ultid = c_ultid[0]["last_value"]
      res = Aporte.connection.execute <<-SQL
        #{ins}
      SQL
      c_acid = Aporte.connection.execute <<-SQL
        SELECT last_value FROM aporte_id_seq;
      SQL
      acid = c_acid[0]["last_value"]

      msg = "Se agregaron #{res.cmd_tuples} aportes"
      if acid > ultid
        msg += " con ids entre #{ultid+1} y #{acid}"
      end
      msg += ". "

      napo = Aporte.where("id > ?", ultid).where("id <= ?", acid).
        pluck(:persona_id)

      flash[:notice] = msg
      redirect_to main_app.consaportantes_path
    end

    def lista_params
      atributos_form - [
        :aportes
      ] + [
        :am_año, 
        :am_mes,
        :etnia_id,
      ] + [
        :aporte_attributes => [
          :anio,
          :id,
          :mes,
          :valor,
          :_destroy
        ],
        etiqueta_persona_attributes:  [
          :etiqueta_id, 
          :fecha_localizada,
          :id,
          :observaciones,
          :usuario_id,
          :_destroy
        ],
      ]
    end

    def caso_params
      params.require(:persona).permit(lista_params)
    end
  end
end
