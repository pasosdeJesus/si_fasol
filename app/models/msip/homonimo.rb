# frozen_string_literal: true

module Msip
  class Homonimo < ActiveRecord::Base

    include Msip::Modelo

    belongs_to :personauno, 
      class_name: "Msip::Persona",
      primary_key: :id,
      foreign_key: :persona1_id,
      validate: true,
      optional: false
    belongs_to :personados, 
      class_name: "Msip::Persona",
      primary_key: :id,
      foreign_key: :persona2_id,
      validate: true,
      optional: false

    validates :persona1_id, presence: true
    validates :persona2_id, presence: true

    validates :persona2_id, uniqueness: {
      scope: :persona1_id,
      message: "No pueden repetirse homonimos"
    }

    validate :primero_menor
    def primero_menor
      if persona1_id && persona2_id && persona1_id >= persona2_id
        errors.add(:persona1_id, "Primera persona debe tener id menor")
      end
    end


  end
end
