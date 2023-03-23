# frozen_string_literal: true

require "test_helper"

  class AliadoasisteTest < ActiveSupport::TestCase
    setup do
      Rails.application.config.x.formato_fecha = "yyyy-mm-dd"
    end

    test "valido" do
      persona = Msip::Persona.create(PRUEBA_PERSONA)
      assert persona.valid?

      actividad = Cor1440Gen::Actividad.create(PRUEBA_ACTIVIDAD)
      assert_predicate actividad, :valid?

      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER.merge(id: nil))

      assert_predicate grupoper, :valid?
      grupoper.save!

      tipoorg = Msip::Tipoorg.new(PRUEBA_TIPOORG)

      assert_predicate tipoorg, :valid?

      entidad = Msip::Orgsocial.new(PRUEBA_ORGSOCIAL.merge(id: nil))
      entidad.grupoper = grupoper
      entidad.tipoorg= tipoorg

      assert_predicate entidad, :valid?
      entidad.save!


      cargoestado = ::Cargoestado.create(PRUEBA_CARGOESTADO)
      assert cargoestado.valid?

      aliadoasiste = Aliadoasiste.create(
        persona_id: persona.id,
        actividad_id: actividad.id,
        entidad_id: entidad.id,
        cargoestado_id: cargoestado.id,
        celular: '123',
        correo: 'a123@localhost',
      )

      assert_predicate aliadoasiste, :valid?

      aliadoasiste.destroy
      cargoestado.destroy
      entidad.destroy
      actividad.destroy
      persona.destroy
    end

    test "no valido" do
      aliadoasiste = ::Aliadoasiste.new(
        persona_id: nil,
      )

      assert_not aliadoasiste.valid?
      aliadoasiste.destroy
    end
  end
