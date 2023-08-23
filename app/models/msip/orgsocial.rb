# frozen_string_literal: true

require "msip/concerns/models/orgsocial"

module Msip
  class Orgsocial < ActiveRecord::Base
    include Msip::Concerns::Models::Orgsocial

    belongs_to :subde,
      class_name: "Msip::Orgsocial",
      validate: false,
      optional: true

    scope :filtro_subde_id, lambda {|id|
      where(subde_id: id)
    }

  end
end
