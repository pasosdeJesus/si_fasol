
require 'sivel2_gen/concerns/models/caso'

module Sivel2Gen 
  class Caso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Caso

    validates :ayudafasol, length: {maximum: 1024}
    validates :codigofasol, length: {maximum: 32}
    validates :marbetefasol, length: {maximum: 256}

  end
end
