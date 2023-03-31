# frozen_string_literal: true

require "jos19/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Msip::ModelosController
    load_and_authorize_resource class: Msip::Persona

    include Jos19::Concerns::Controllers::PersonasController

    def atributos_show
      atributos_show_jos19 +
        [:familiarvictima_ids] -
        [:proyectofinanciero_ids]
    end

    def atributos_form
      atributos_form_jos19 - 
        [:proyectofinanciero_ids]
    end

    def index_reordenar(c)
      c.reorder([:nombres, :apellidos])
    end

    def destroy
      if Sivel2Gen::Victima.where(id_persona: @registro.id).count == 0
        Msip::PersonaTrelacion.where(persona1: @registro.id).delete_all
        Msip::PersonaTrelacion.where(persona2: @registro.id).delete_all
      end
      destroy_gen
    end
  end
end
