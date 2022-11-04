module Cor1440Gen
  class Opcioncaracterizacion < ActiveRecord::Base
    include Sip::Basica


    has_and_belongs_to_many :asistencia, 
      class_name: 'Cor1440Gen::Asistencia',
      foreign_key: 'opcioncaracterizacion_id',
      association_foreign_key: 'asistencia_id',
      join_table: 'cor1440_gen_asistencia_opcioncaracterizacion'

    def nombre=(val)
      self[:nombre] = val.squish
    end

  end
end
