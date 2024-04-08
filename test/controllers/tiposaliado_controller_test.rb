require 'test_helper'

# Esta prueba supone que en la tabla básica hay un registro con id 1
# Si no lo hay agregar skip a pruebas que lo suponen o crear registro
# con id 1 en las mismas o en setup

module Admin
  class TiposaliadoControllerTest < ActionDispatch::IntegrationTest
    TIPOALIADO_NUEVO = {
      nombre: 'X',
      observaciones: 'y',
      fechacreacion: '2024-04-08',
      fechadeshabilitacion: nil,
      created_at: '2024-04-08',
      updated_at: '2024-04-08',
    }

    IDEX = 10

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup do
      if ENV["CONFIG_HOSTS"] != "www.example.com"
        raise "CONFIG_HOSTS debe ser www.example.com"
      end
      if ENV["RUTA_RELATIVA"] != "/"
        raise "Por RUTA_RELATIVA debe ser /"
      end

      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
    end

    # Cada prueba se ejecuta en una transacción de la base de datos
    # que después de la prueba se revierte. Por lo que no
    # debe preocuparse por restaurar/borrar lo que modifique/elimine/agregue
    # en cada prueba.

    test "debe presentar listado" do
      get admin_tiposaliado_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      tipoaliado = ::Tipoaliado.create!(
        TIPOALIADO_NUEVO.merge(id: IDEX)
      )
      get admin_tipoaliado_url(Tipoaliado.find(IDEX))
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get new_admin_tipoaliado_path
      assert_response :success
      assert_template :new
    end

    test "debe crear nueva" do
      assert_difference('Tipoaliado.count') do
        post admin_tiposaliado_path, params: { 
          tipoaliado: TIPOALIADO_NUEVO
        }
      end

      assert_redirected_to admin_tipoaliado_path(
        assigns(:tipoaliado))
    end

    test "debe actualizar existente" do
      tipoaliado = ::Tipoaliado.create!(
        TIPOALIADO_NUEVO.merge(id: IDEX)
      )
      patch admin_tipoaliado_path(Tipoaliado.find(IDEX)),
        params: { tipoaliado: { nombre: 'YY'}}

      assert_redirected_to admin_tipoaliado_path(
        assigns(:tipoaliado))
    end

    test "debe eliminar" do
      r = Tipoaliado.create!(TIPOALIADO_NUEVO)
      assert_difference('Tipoaliado.count', -1) do
        delete admin_tipoaliado_url(Tipoaliado.find(r.id))
      end

      assert_redirected_to admin_tiposaliado_path
    end
  end
end
