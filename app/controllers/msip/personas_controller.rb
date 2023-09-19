# frozen_string_literal: true

require "jos19/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Msip::ModelosController
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
        :pais_id,
        :departamento_id,
        :municipio_id,
        :clase_id,
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
        :aportes,
        :etiqueta_ids,
      ]
    end

    def atributos_form
      a = atributos_show  - [
        :actividad_ids,
        :caso_ids,
        :familiarvictima_ids,
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
        :clase,
        :nacionalde,
        :etiqueta_ids,
        :actividad_ids,
        :caso_ids,
        :familiarvictima_ids,
        :aportes,
      ]
    end

    def index_reordenar(c)
      c.reorder([:nombres, :apellidos])
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

    def lista_params
      atributos_form - [
        :aportes
      ] + [
        :aporte_attributes => [
          :anio,
          :id,
          :mes,
          :valor,
          :_destroy
        ]
      ]
    end

    def caso_params
      params.require(:persona).permit(lista_params)
    end
  end
end
