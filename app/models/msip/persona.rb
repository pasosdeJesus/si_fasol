require 'jos19/concerns/models/persona'

module Msip
  class Persona < ActiveRecord::Base
    include Jos19::Concerns::Models::Persona
  end
end
