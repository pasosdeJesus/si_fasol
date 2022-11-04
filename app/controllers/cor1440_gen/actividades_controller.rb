require "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < Heb412Gen::ModelosController

    before_action :set_actividad, 
      only: [:show, :edit, :update, :destroy],
      exclude: [:contar, :contar_beneficiarios]
    load_and_authorize_resource class: Cor1440Gen::Actividad

    include Cor1440Gen::Concerns::Controllers::ActividadesController


    def atributos_show
      [ :id, 
        :fecha_localizada, 
        :nombre, 
        :lugar, 
        :responsable,
        :corresponsables,
        :proyectofinanciero, 
        :actividadpf, 
        :respuestafor,
        :objetivo,
        :resultado, 
        # :orgsocial,  -- por la cantidad de organizaicones hace muy lenta
        # la carga, cambiar por autocompletación
        :listadoasistencia,
        :poblacion,
        :anexos
      ]
    end

    def lista_params
      l = lista_params_cor1440_gen
      l[-1][:asistencia_attributes][-1][:opcioncaracterizacion_ids] = []
      return l
    end

  end # class
end # module
