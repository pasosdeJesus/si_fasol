class Tipoaliado < ActiveRecord::Base
  include Msip::Basica

  has_many :persona,
    foreign_key: "tipoaliado_id",
    class_name: "Msip::Persona",
    validate: true
end
