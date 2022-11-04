require 'test_helper'

module Cor1440Gen
  class OpcioncaracterizacionTest < ActiveSupport::TestCase

    PRUEBA_OPCIONCARACTERIZACION = {
      nombre: "Opcioncaracterizacion",
      fechacreacion: "2022-10-31",
      created_at: "2022-10-31"
    }

    test "valido" do
      opcioncaracterizacion = Cor1440Gen::Opcioncaracterizacion.create(
        PRUEBA_OPCIONCARACTERIZACION
      )
      assert(opcioncaracterizacion.valid?)
      opcioncaracterizacion.destroy
    end

    test "no valido" do
      opcioncaracterizacion = Cor1440Gen::Opcioncaracterizacion.new(
        PRUEBA_OPCIONCARACTERIZACION
      )
      opcioncaracterizacion.nombre = ''
      assert_not(opcioncaracterizacion.valid?)
      opcioncaracterizacion.destroy
    end

    test "existente" do
      skip
      opcioncaracterizacion = ::Opcioncaracterizacion.where(id: 0).take
      assert_equal(opcioncaracterizacion.nombre, "SIN INFORMACIÓN")
    end

  end
end
