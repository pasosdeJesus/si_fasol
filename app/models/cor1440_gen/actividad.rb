# frozen_string_literal: true

require "cor1440_gen/concerns/models/actividad"

module Cor1440Gen
  class Actividad < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Actividad

    has_many :aliadoasiste, dependent: :delete_all,
      class_name: 'Aliadoasiste',
      foreign_key: 'actividad_id',
      validate: true

    has_many :persona, through: :aliadoasiste, class_name: 'Msip::Persona'
    accepts_nested_attributes_for :persona, reject_if: :all_blank
    accepts_nested_attributes_for :aliadoasiste,
      allow_destroy: true, reject_if: :all_blank

  end
end
