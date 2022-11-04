require 'cor1440_gen/concerns/models/asistencia'

module Cor1440Gen
  class Asistencia < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Asistencia

    has_and_belongs_to_many :opcioncaracterizacion, 
      class_name: 'Cor1440Gen::Opcioncaracterizacion',
      foreign_key: 'asistencia_id',
      association_foreign_key: 'opcioncaracterizacion_id',
      join_table: 'cor1440_gen_asistencia_opcioncaracterizacion'

  end
end
