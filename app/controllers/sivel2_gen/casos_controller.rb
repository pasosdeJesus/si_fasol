# frozen_string_literal: true

require 'sivel2_gen/concerns/controllers/casos_controller'

module Sivel2Gen
  class CasosController < Heb412Gen::ModelosController

    include Sivel2Gen::Concerns::Controllers::CasosController

    before_action :set_caso, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sivel2Gen::Caso, 
      except: [:index, :show, :mapaosm, :update]

    include Sivel2Gen::Concerns::Controllers::CasosController

    def campoord_inicial
      'fecha'
    end

    def lista_params
      l = lista_params_sivel2_gen
      l[l.count-1][:victima_attributes].delete(:id_vinculoestado)
      l[l.count-1][:victima_attributes].unshift(:entidad_id)
      l[l.count-1][:victima_attributes].unshift(:detallevinculoestado)
      l[l.count-1][:victima_attributes].unshift(:cargoestado_id)

      return l
    end

  end
end
