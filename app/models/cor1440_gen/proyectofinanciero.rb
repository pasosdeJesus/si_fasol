require 'cor1440_gen/concerns/models/proyectofinanciero'

module Cor1440Gen
  class Proyectofinanciero < ActiveRecord::Base

    include Cor1440Gen::Concerns::Models::Proyectofinanciero

    # Id del proyecto con actividades comunes vigente
    # nil significa que no hay
    def self.actividades_comunes_id
      return 10
    end

  end
end
