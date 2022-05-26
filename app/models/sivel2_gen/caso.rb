
require 'sivel2_gen/concerns/models/caso'

module Sivel2Gen 
  class Caso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Caso

    has_many :caso_observacion, dependent: :delete_all,
      class_name: 'Sivel2Gen::CasoObservacion',
      foreign_key: 'caso_id'
    has_many :observacion, through: :caso_observacion, 
      dependent: :delete_all,
      class_name: 'Sip::Observacion'
    accepts_nested_attributes_for :observacion,
      allow_destroy: true, reject_if: :all_blank
    accepts_nested_attributes_for :caso_observacion,
      allow_destroy: true, reject_if: :all_blank

    validates :ayudafasol, length: {maximum: 1024}
    validates :codigofasol, length: {maximum: 32}
    validates :marbetefasol, length: {maximum: 256}

  end
end
