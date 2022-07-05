require 'sivel2_gen/concerns/controllers/validarcasos_controller'

module Sivel2Gen
  class ValidarcasosController < ApplicationController


    load_and_authorize_resource class: Sivel2Gen::Caso
    include Sivel2Gen::Concerns::Controllers::ValidarcasosController


    ## Casos sin región
    def validar_sinregion
      casos = ini_filtro
      validacion_estandar(
        casos, 
        'Casos sin región',
        'id NOT IN (SELECT id_caso FROM sivel2_gen_caso_region)'
      )
    end

    def validar_interno
      crear_vista_iniciador
      validar_sinregion
      validar_sivel2_gen
    end # def validar_interno

  end
end
