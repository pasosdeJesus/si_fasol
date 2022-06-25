require 'sip/concerns/controllers/solicitudes_controller'

module Sip
  class SolicitudesController < Heb412Gen::ModelosController

    before_action :set_solicitud, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sip::Solicitud

    include Sip::Concerns::Controllers::SolicitudesController

    def atributos_index
      [
        :id, 
        :usuario_id, 
        :fecha,
        :solicitud
        #:estadosol_id,
        #:usuarionotificar_ids
      ]
    end

    def atributos_form
      [
        :id, 
        :usuario_id, 
        :fecha,
        :solicitud
        #:estadoobs_id,
        #:usuarionotificar_ids
      ]
    end

  end
end
