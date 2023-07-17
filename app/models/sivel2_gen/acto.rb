
require 'sivel2_gen/concerns/models/acto'

module Sivel2Gen
  class Acto < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Acto

    campofecha_localizado :fecha

  end
end
