module Admin
  class CargosestadoController < Sip::Admin::BasicasController
    before_action :set_cargoestado, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: ::Cargoestado

    def clase 
      "::Cargoestado"
    end

    def set_cargoestado
      @basica = Cargoestado.find(params[:id])
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

    def cargoestado_params
      params.require(:cargoestado).permit(*atributos_form)
    end

  end
end
