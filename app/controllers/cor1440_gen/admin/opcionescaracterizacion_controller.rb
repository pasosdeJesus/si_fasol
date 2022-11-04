module Cor1440Gen
  module Admin
    class OpcionescaracterizacionController < Sip::Admin::BasicasController
      before_action :set_opcioncaracterizacion, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Cor1440Gen::Opcioncaracterizacion

      def clase 
        "Cor1440Gen::Opcioncaracterizacion"
      end

      def set_opcioncaracterizacion
        @basica = Cor1440Gen::Opcioncaracterizacion.find(params[:id])
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

      def opcioncaracterizacion_params
        params.require(:opcioncaracterizacion).permit(*atributos_form)
      end

    end
  end
end
