# frozen_string_literal: true

class Aliadoasiste < ActiveRecord::Base

  include Msip::Modelo

  belongs_to :persona,
    class_name: "Msip::Persona",
    validate: true,
    optional: false
  accepts_nested_attributes_for :persona, reject_if: :all_blank
  belongs_to :actividad,
    class_name: "Cor1440Gen::Actividad",
    validate: true,
    optional: false
  belongs_to :entidad,
    class_name: "Msip::Orgsocial",
    foreign_key: "entidad_id",
    optional: true
  belongs_to :cargoestado,
    class_name: "Cargoestado",
    optional: true

  validates :telefono, length: {maximum: 30}
  validates :correo, length: {maximum: 60}
  validates :observaciones, length: {maximum: 5000}

  validates :persona,
    uniqueness: {
      scope: :actividad_id,
      message: "El listado de aliados no puede tener personas repetidas",
    }

end
