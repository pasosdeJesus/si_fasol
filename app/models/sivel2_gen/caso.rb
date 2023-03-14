# frozen_string_literal: true

require "sivel2_gen/concerns/models/caso"

module Sivel2Gen
  class Caso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Caso

    has_many :caso_solicitud,
      dependent: :delete_all,
      class_name: "Sivel2Gen::CasoSolicitud"
    has_many :solicitud,
      through: :caso_solicitud,
      dependent: :delete_all,
      class_name: "Msip::Solicitud"
    accepts_nested_attributes_for :solicitud,
      allow_destroy: true,
      reject_if: :all_blank
    accepts_nested_attributes_for :caso_solicitud,
      allow_destroy: true,
      reject_if: :all_blank

    validates :ayudafasol, length: { maximum: 1024 }
    validates :codigofasol, length: { maximum: 32 }
    validates :marbetefasol, length: { maximum: 256 }
  end
end
