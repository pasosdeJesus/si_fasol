# frozen_string_literal: true

require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase
  test "iniciar sesión" do
    skip
    Msip::CapybaraHelper.iniciar_sesion(
      self, Rails.configuration.relative_url_root, "sivel2", "sivel2"
    )
  end
end
