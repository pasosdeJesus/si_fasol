# frozen_string_literal: true

require "test_helper"

# Esta prueba supone que en la tabla básica hay un registro con id 1
# Si no lo hay agregar skip a pruebas que lo suponen o crear registro
# con id 1 en las mismas o en setup

module Admin
  class CargosestadoControllerTest < ActionDispatch::IntegrationTest
    CARGOESTADO_NUEVO = {
      nombre: "X",
      observaciones: "y",
      fechacreacion: "2022-05-18",
      fechadeshabilitacion: nil,
      created_at: "2022-05-18",
      updated_at: "2022-05-18",
    }

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
      skip
      get admin_cargosestado_path

      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      skip
      get admin_cargoestado_url(Cargoestado.find(IDEX))

      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      skip
      get new_admin_cargoestado_path

      assert_response :success
      assert_template :new
    end

    test "debe crear nueva" do
      skip
      assert_difference("Cargoestado.count") do
        post admin_cargosestado_path, params: {
          cargoestado: CARGOESTADO_NUEVO,
        }
      end

      assert_redirected_to admin_cargoestado_path(
        assigns(:cargoestado),
      )
    end

    test "debe actualizar existente" do
      skip
      patch admin_cargoestado_path(Cargoestado.find(IDEX)),
        params: { cargoestado: { nombre: "YY" } }

      assert_redirected_to admin_cargoestado_path(
        assigns(:cargoestado),
      )
    end

    test "debe eliminar" do
      skip
      r = Cargoestado.create!(CARGOESTADO_NUEVO)
      assert_difference("Cargoestado.count", -1) do
        delete admin_cargoestado_url(Cargoestado.find(r.id))
      end

      assert_redirected_to admin_cargosestado_path
    end
  end
end
