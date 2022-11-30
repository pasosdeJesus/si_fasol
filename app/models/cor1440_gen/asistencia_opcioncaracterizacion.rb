module Cor1440Gen
  class AsistenciaOpcioncaracterizacion < ActiveRecord::Base

    belongs_to :opcioncaracterizacion, 
      class_name: 'Cor1440Gen::Actividadpf', 
      foreign_key: 'opcioncaracterizacion_id', 
      optional: false
    belongs_to :asistencia, 
      class_name: 'Cor1440Gen::Asistencia',
      foreign_key: 'asistencia_id', 
      optional: false

  end
end
