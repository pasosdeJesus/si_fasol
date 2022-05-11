require 'sip/concerns/models/orgsocial'

module Sip
  class Orgsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Orgsocial

    belongs_to :subde, class_name: 'Sip::Orgsocial',
      foreign_key: 'subde_id', validate: false, optional: true
  end
end
