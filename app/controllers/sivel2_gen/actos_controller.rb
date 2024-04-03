require 'sivel2_gen/concerns/controllers/actos_controller'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto
    before_action :prepara_caso

    include Sivel2Gen::Concerns::Controllers::ActosController

    def pasan_validaciones_create?(merr)
      if (params[:caso] && 
          (!params[:caso][:acto_fecha] || params[:caso][:acto_fecha] == ""))
        merr << "Debe tener fecha"
        return false
      end
      return true
    end

    def completar_acto(acto, params)
      acto[:fecha] = params[:caso][:acto_fecha]
    end

    def prepara_caso
      @caso = Sivel2Gen::Caso.new(
        acto: [Sivel2Gen::Acto.new])
    end


  end 
end
