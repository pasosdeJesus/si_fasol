module Admin
  class RegionespagoController < Msip::Admin::BasicasController
    before_action :set_regionpago, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Regionpago

    def clase 
      "::Regionpago"
    end

    def set_regionpago
      @basica = Regionpago.find(params[:id])
    end

    def atributos_index
      [
        :id, 
        :nombre, 
        :observaciones, 
        :fechacreacion_localizada, 
        :habilitado
      ]
    end

    def genclase
      'F'
    end

    def regionpago_params
      params.require(:regionpago).permit(*atributos_form)
    end

  end
end
