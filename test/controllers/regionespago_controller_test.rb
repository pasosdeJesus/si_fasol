require_relative '../test_helper'

# Esta prueba supone que en la tabla básica hay un registro con id 1
# Si no lo hay agregar skip a pruebas que lo suponen o crear registro
# con id 1 en las mismas o en setup

module Admin
  class RegionespagoControllerTest < ActionDispatch::IntegrationTest
    IDEX = 10

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
    end

    # Cada prueba se ejecuta en una transacción de la base de datos
    # que después de la prueba se revierte. Por lo que no
    # debe preocuparse por restaurar/borrar lo que modifique/elimine/agregue
    # en cada prueba.

    test "debe presentar listado" do
      get admin_regionespago_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get admin_regionpago_url(Regionpago.find(IDEX))
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get new_admin_regionpago_path
      assert_response :success
      assert_template :new
    end

    test "debe crear nueva" do
      assert_difference('Regionpago.count') do
        post admin_regionespago_path, params: { 
          regionpago: PRUEBA_REGIONPAGO
        }
      end

      assert_redirected_to admin_regionpago_path(
        assigns(:regionpago))
    end

    test "debe actualizar existente" do
      patch admin_regionpago_path(Regionpago.find(IDEX)),
        params: { regionpago: { nombre: 'YY'}}

      assert_redirected_to admin_regionpago_path(
        assigns(:regionpago))
    end

    test "debe eliminar" do
      r = Regionpago.create!(PRUEBA_REGIONPAGO)
      assert_difference('Regionpago.count', -1) do
        delete admin_regionpago_url(Regionpago.find(r.id))
      end

      assert_redirected_to admin_regionespago_path
    end
  end
end
