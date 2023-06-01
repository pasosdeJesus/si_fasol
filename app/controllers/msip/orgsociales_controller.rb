# frozen_string_literal: true

require "msip/concerns/controllers/orgsociales_controller"

module Msip
  class OrgsocialesController < Msip::ModelosController
    before_action :set_orgsocial, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Msip::Orgsocial

    include Msip::Concerns::Controllers::OrgsocialesController

    def atributos_index
      [
        :id,
        :grupoper_id,
        :tipoorg_id,
        { orgsocial_persona: [] },
        :web,
        :habilitado,
        :created_at_localizada,
      ]
    end

    def atributos_show
      [
        :id,
        :grupoper_id,
        :tipoorg_id,
        { orgsocial_persona: [] },
        :web,
        :pais_id,
        :direccion,
        :telefono,
        :fax,
        :created_at_localizada,
        :fechadeshabilitacion_localizada,
      ]
    end

  end
end
