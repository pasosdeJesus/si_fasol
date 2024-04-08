module Admin
  class TiposaliadoController < Msip::Admin::BasicasController
    before_action :set_tipoaliado, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Tipoaliado

    def clase 
      "::Tipoaliado"
    end

    def set_tipoaliado
      @basica = Tipoaliado.find(params[:id])
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
      'M'
    end

    def tipoaliado_params
      params.require(:tipoaliado).permit(*atributos_form)
    end

  end
end
