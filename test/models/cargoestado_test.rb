require 'test_helper'

class CargoestadoTest < ActiveSupport::TestCase

  PRUEBA_CARGOESTADO = {
    nombre: "Cargoestado",
    fechacreacion: "2022-05-18",
    created_at: "2022-05-18"
  }

  test "valido" do
    cargoestado = ::Cargoestado.create(
      PRUEBA_CARGOESTADO)
    assert(cargoestado.valid?)
    cargoestado.destroy
  end

  test "no valido" do
    cargoestado = ::Cargoestado.new(
      PRUEBA_CARGOESTADO)
    cargoestado.nombre = ''
    assert_not(cargoestado.valid?)
    cargoestado.destroy
  end

  test "existente" do
    cargoestado = ::Cargoestado.where(id: 1).take
    assert_equal(cargoestado.nombre, "Sin Información")
  end

end
