
require 'sivel2_gen/concerns/models/victima'

module Sivel2Gen
  class Victima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victima

    belongs_to :entidad, foreign_key: 'entidad_id',
      validate: true, class_name: 'Sip::Orgsocial',
      optional: true
    belongs_to :cargoestado, foreign_key: 'cargoestado_id',
      validate: true, class_name: '::Cargoestado',
      optional: true
    validates :detallevinculoestado, length: {maximum: 512}
  end
end
