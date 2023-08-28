# frozen_string_literal: true

class Aporte < ActiveRecord::Base

  include Msip::Modelo

  belongs_to :persona,
    class_name: "Msip::Persona",
    validate: true,
    optional: false

  validates :anio, presence: true
  validates :mes, presence: true
  validates :valor, presence: true

  validates :persona,
    uniqueness: {
      scope: [:anio,:mes],
      message: "No puede haber valores repetidos para un mismo mes y persona",
    }

end
