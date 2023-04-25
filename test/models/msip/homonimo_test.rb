# frozen_string_literal: true

require_relative "../../test_helper"

module Msip
  class HomonimoTest < ActiveSupport::TestCase
    test "valido" do
      persona1 = Msip::Persona.create(
        id: 1,
        nombres: "nombre1",
        apellidos: "apellidos1",
        tdocumento_id: 11,
        numerodocumento: 1,
        sexo: "S",
      )

      assert_predicate persona1, :valid?
      persona2 = Msip::Persona.create(
        id: 2,
        nombres: "nombre2",
        apellidos: "apellidos2",
        tdocumento_id: 11,
        numerodocumento: 2,
        sexo: "S",
      )

      assert_predicate persona2, :valid?

      pt = Msip::Homonimo.create(
        personauno: persona1,
        personados: persona2,
      )

      assert_predicate pt, :valid?
      pt.destroy!
      persona1.destroy!
      persona2.destroy!
    end

    test "invalido: falta persona 1" do
      persona2 = Msip::Persona.create(
        nombres: "nombrei12", 
        apellidos: "apellidosi12", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 2,
        id: 2
      )

      assert_predicate persona2, :valid?

      pt = Msip::Homonimo.create(
        personados: persona2,
        personauno: nil
      )

      assert_not pt.valid?
      persona2.destroy!
    end

    test "invalido: falta persona 2" do
      persona1 = Msip::Persona.create(
        nombres: "nombrei21", 
        apellidos: "apellidos1", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 1,
        id: 1
      )

      assert_predicate persona1, :valid?

      pt = Msip::Homonimo.create(
        personauno: persona1,
      )

      assert_not pt.valid?
      persona1.destroy!
    end

    test "invalido: no única" do
      persona1 = Msip::Persona.create(
        nombres: "nombrei41", 
        apellidos: "apellidos1", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 1,
        id: 1
      )

      assert_predicate persona1, :valid?
      persona2 = Msip::Persona.create(
        nombres: "nombre2", 
        apellidos: "apellidos2", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 2,
        id: 2

      )

      assert_predicate persona2, :valid?

      pt = Msip::Homonimo.create(
        personauno: persona1,
        personados: persona2,
      )

      assert_predicate pt, :valid?
      pt2 = Msip::Homonimo.create(
        personauno: persona1,
        personados: persona2,
      )

      assert_not pt2.valid?
      pt.destroy!
      persona1.destroy!
      persona2.destroy!
    end

    test "invalido: persona 2 con id menor" do
      persona1 = Msip::Persona.create(
        nombres: "nombrei41", 
        apellidos: "apellidos1", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 1,
        id: 1
      )

      assert_predicate persona1, :valid?
      persona2 = Msip::Persona.create(
        nombres: "nombre2", 
        apellidos: "apellidos2", 
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: 2,
        id: 2

      )

      assert_predicate persona2, :valid?

      pt = Msip::Homonimo.create(
        personauno: persona2,
        personados: persona1,
      )

      assert_not pt.valid?
      persona1.destroy!
      persona2.destroy!
    end


  end
end
