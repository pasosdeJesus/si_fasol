require 'sivel2_gen/concerns/controllers/caso_solicitudes_controller'

module Sivel2Gen
  class CasoSolicitudesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoSolicitud
    include Sivel2Gen::Concerns::Controllers::CasoSolicitudesController

    def solicitud_simplificada
      true
    end

  end
end
