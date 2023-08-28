require 'test_helper'

class RegionpagoTest < ActiveSupport::TestCase

  PRUEBA_REGIONPAGO = {
    nombre: "Regionpago",
    fechacreacion: "2023-08-27",
    created_at: "2023-08-27"
  }

  test "valido" do
    regionpago = ::Regionpago.create(
      PRUEBA_REGIONPAGO)
    assert(regionpago.valid?)
    regionpago.destroy
  end

  test "no valido" do
    regionpago = ::Regionpago.new(
      PRUEBA_REGIONPAGO)
    regionpago.nombre = ''
    assert_not(regionpago.valid?)
    regionpago.destroy
  end

  test "existente" do
    skip
    regionpago = ::Regionpago.where(id: 0).take
    assert_equal(regionpago.nombre, "SIN INFORMACIÓN")
  end

end
