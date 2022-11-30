require 'cor1440_gen/concerns/models/asistencia'

module Cor1440Gen
  class Asistencia < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Asistencia

    has_many :asistencia_opcioncaracterizacion, 
      class_name: 'Cor1440Gen::AsistenciaOpcioncaracterizacion',
      foreign_key: 'asistencia_id',
      dependent: :destroy

    has_many :opcioncaracterizacion, 
      through: :asistencia_opcioncaracterizacion,
      class_name: 'Cor1440Gen::Actividadpf'

  end
end
