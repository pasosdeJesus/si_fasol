# frozen_string_literal: true

module Msip
  class HomonimosController < Msip::ModelosController

    before_action :set_homonimo, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Msip::Homonimo

    def clase
      "Msip::Homonimo"
    end

    def genclase
      "M"
    end

    def atributos_show_msip
      [
        :id,
        :persona1_id,
        :persona2_id,
      ]
    end

    def atributos_show
      atributos_show_msip
    end

    def atributos_index
      atributos_show
    end

    def atributos_form
      a = atributos_show
      a
    end

    def set_homonimo
      @homonimo = Msip::Homonimo.find(params[:id])
      @registro = @homonimo
    end

    def lista_params
      [:id, :persona1_id, :persona2_id]
    end

    def homonimo_params
      params.require(:homonimo).permit(lista_params)
    end

  end 
end
