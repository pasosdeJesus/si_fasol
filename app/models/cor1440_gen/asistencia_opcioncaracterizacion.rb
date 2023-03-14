# frozen_string_literal: true

module Cor1440Gen
  class AsistenciaOpcioncaracterizacion < ActiveRecord::Base
    belongs_to :opcioncaracterizacion,
      class_name: "Cor1440Gen::Actividadpf",
      optional: false
    belongs_to :asistencia,
      class_name: "Cor1440Gen::Asistencia",
      optional: false
  end
end
