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
        :subde_id,
        { sectororgsocial_ids: [] },
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
        :subde_id,
        { sectororgsocial_ids: [] },
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

    def arma_jerarquia(subde_id, nombre_papa)
      hijos = Msip::Orgsocial.habilitados.where(subde_id: subde_id)
      hijosa = hijos.map do |h|
        arma_jerarquia(h.id, h.grupoper.nombre)
      end
      { id: subde_id, nombre: nombre_papa, hijos: hijosa }
    end

    def jerarquia
      @jerarquiaorgsociales = arma_jerarquia(nil, "")
      render("jerarquia", layout: "application")
    end
  end
end
