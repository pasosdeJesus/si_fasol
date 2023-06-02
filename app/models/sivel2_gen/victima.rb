# frozen_string_literal: true

require "sivel2_gen/concerns/models/victima"

module Sivel2Gen
  class Victima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victima


    belongs_to :entidad,
      validate: true,
      class_name: "Msip::Orgsocial",
      optional: true
    belongs_to :cargoestado,
      validate: true,
      class_name: "::Cargoestado",
      optional: true

    validates :entidad_id, numericality: true

    validates :detallevinculoestado, length: { maximum: 512 }

    attr_accessor :entidad_nombre

    def entidad_nombre
      if entidad && entidad.grupoper
        entidad.grupoper.nombre
      else
        ''
      end
    end
  end
end
