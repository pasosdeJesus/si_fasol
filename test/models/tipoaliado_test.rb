require 'test_helper'

class TipoaliadoTest < ActiveSupport::TestCase

  PRUEBA_TIPOALIADO = {
    nombre: "Tipoaliado",
    fechacreacion: "2024-04-08",
    created_at: "2024-04-08"
  }

  test "valido" do
    tipoaliado = ::Tipoaliado.create(
      PRUEBA_TIPOALIADO)
    assert(tipoaliado.valid?)
    tipoaliado.destroy
  end

  test "no valido" do
    tipoaliado = ::Tipoaliado.new(
      PRUEBA_TIPOALIADO)
    tipoaliado.nombre = ''
    assert_not(tipoaliado.valid?)
    tipoaliado.destroy
  end

  test "existente" do
    tipoaliado = ::Tipoaliado.where(id: 1).take
    assert_equal(tipoaliado.nombre, "Sin información")
  end

end
