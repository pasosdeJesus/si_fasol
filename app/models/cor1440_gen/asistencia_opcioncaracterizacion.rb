module Cor1440Gen
  class AsistenciaOpcioncaracterizacion < ActiveRecord::Base
    include Sip::Basica

    belongs_to :opcioncaracterizacion, 
      class_name: 'Cor1440Gen::Opcioncaracterizacion', 
      foreign_key: 'opcioncaracterizacion_id', 
      dependat: :destroy,
      optional: false
    belongs_to :asistencia, 
      class_name: 'Cor1440Gen::Proyectofinanciero',
      foreign_key: 'asistencia_id', 
      optional: false

  end
end
