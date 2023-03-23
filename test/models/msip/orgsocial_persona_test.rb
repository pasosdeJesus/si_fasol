# frozen_string_literal: true

require_relative "../../test_helper"

module Msip
  class OrgsocialPersonaTest < ActiveSupport::TestCase
    test "valido" do
      grupoper = Msip::Grupoper.create(PRUEBA_GRUPOPER.merge(id:nil))

      assert_predicate grupoper, :valid?
      grupoper.save!

      tipoorg = Msip::Tipoorg.new(PRUEBA_TIPOORG.merge(id:nil))

      assert_predicate tipoorg, :valid?

      orgsocial = Msip::Orgsocial.new(PRUEBA_ORGSOCIAL.merge(id:nil))
      orgsocial.grupoper = grupoper
      orgsocial.tipoorg= tipoorg

      assert_predicate orgsocial, :valid?
      orgsocial.save!

      persona = Msip::Persona.create(PRUEBA_PERSONA.merge(id:nil))

      assert_predicate persona, :valid?
      persona.save!

      perfilorgsocial = Msip::Perfilorgsocial.create(PRUEBA_PERFILORGSOCIAL.merge(id:nil))

      assert_predicate perfilorgsocial, :valid?
      perfilorgsocial.save!

      orgsocial_persona = Msip::OrgsocialPersona.new
      orgsocial_persona.orgsocial = orgsocial
      orgsocial_persona.persona = persona
      orgsocial_persona.perfilorgsocial = perfilorgsocial
      orgsocial_persona.correo = "correo@localhost"
      orgsocial_persona.cargo = "Esto es mejor de otra manera"

      assert_predicate orgsocial_persona, :valid?
      orgsocial_persona.save!

      orgsocial_persona.destroy
      perfilorgsocial.destroy
      persona.destroy
      orgsocial.destroy
      grupoper.destroy
    end

    test "no valido" do
      orgsocial_persona = Msip::OrgsocialPersona.new

      assert_not orgsocial_persona.valid?
      orgsocial_persona.destroy
    end
  end
end
