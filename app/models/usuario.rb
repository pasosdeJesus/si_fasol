# frozen_string_literal: true

require "sivel2_gen/concerns/models/usuario"
require "cor1440_gen/concerns/models/usuario"

class Usuario < ActiveRecord::Base
  include Sivel2Gen::Concerns::Models::Usuario
  include Cor1440Gen::Concerns::Models::Usuario

  belongs_to :tdocumento,
    class_name: "Msip::Tdocumento",
    validate: true,
    optional: false

  campofecha_localizado :fechanac

  validates :numerodocumento,
    length: { maximum: 100 },
    presence: true,
    allow_blank: false
  validates :tdocumento, presence: true, allow_blank: false
  validates :numerodocumento,
    presence: true,
    allow_blank: false,
    uniqueness: {
      scope: :tdocumento,
      message: "Tipo y número de documento repetido",
    }
  validates :fechanac, presence: true, allow_blank: false
  validates :sexonac, presence: true
  if defined?(Msip::Persona.convencion_sexo[:sexo_femenino])
    validates :sexonac, inclusion: {
      in: [
        Msip::Persona.convencion_sexo[:sexo_femenino].to_s,
        Msip::Persona.convencion_sexo[:sexo_masculino].to_s,
        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s,
      ],
      message: "Sexó debe ser " +
        Msip::Persona.convencion_sexo[:sexo_femenino].to_s + " o " +
        Msip::Persona.convencion_sexo[:sexo_masculino].to_s + " o " +
        Msip::Persona.convencion_sexo[:sexo_sininformacion].to_s,
    }
  end

  scope :filtro_numerodocumento, lambda { |n|
    where(
      "unaccent(numerodocumento) ILIKE '%' || " +
                "unaccent(?) || '%'",
      n,
    )
  }

  scope :filtro_tdocumento_id, lambda { |tid|
    where(tdocumento_id: tid.to_i)
  }

  scope :filtro_sexonac, lambda { |s|
    where(sexonac: s)
  }
end
