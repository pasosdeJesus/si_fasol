require 'msip/concerns/models/orgsocial'

module Msip
  class Orgsocial < ActiveRecord::Base
    include Msip::Concerns::Models::Orgsocial

    belongs_to :subde, class_name: 'Msip::Orgsocial',
      foreign_key: 'subde_id', validate: false, optional: true
  end
end
