module Sivel2Gen
  class CasoObservacion < ActiveRecord::Base
    include Sip::Modelo 

    belongs_to :caso, 
      class_name: 'Sivel2Gen::Caso',
      validate: true, foreign_key: 'caso_id', optional: false
    belongs_to :observacion, class_name: 'Sip::Observacion', validate: true,
      foreign_key: 'observacion_id', optional: false
    accepts_nested_attributes_for :observacion, reject_if: :all_blank

  end
end