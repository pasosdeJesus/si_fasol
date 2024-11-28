# frozen_string_literal: true

require_relative "../../test_helper"

module Msip
  class HomonimosControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    def dedup_ruta(ruta)
      dup = Rails.configuration.relative_url_root + 
        Rails.configuration.relative_url_root

      r = ruta.sub(
        dup.gsub('//', '/'),
        Rails.configuration.relative_url_root
      )
      return r
    end

    setup do
      if ENV["CONFIG_HOSTS"] != "www.example.com"
        raise "CONFIG_HOSTS debe ser www.example.com"
      end

      @current_usuario = ::Usuario.create(PRUEBA_USUARIO_AD)
      sign_in @current_usuario
    end

    test "index: presenta plantilla de indice" do
      get dedup_ruta(homonimos_url)

      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get dedup_ruta(homonimos_url), 
        params: { "homonimo" => { "id" => "1" } }, as: :json

      assert_response :success
    end

    test "presenta plantilla admin/modelos/index" do
      get dedup_ruta(homonimos_url)

      assert_template "msip/modelos/index"
    end

    test "new: formulario de nueva" do
      get dedup_ruta(new_homonimo_url)

      assert_response :success
      assert_template :new
    end

    test "post: crea un registro" do
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

      assert_difference("Msip::Homonimo.count") do
        post(dedup_ruta(homonimos_url), 
          params: { homonimo: {
            persona1_id: persona1.id,
            persona2_id: persona2.id,
            id: nil
          }})
      end

      assert_redirected_to dedup_ruta(homonimo_path(
        assigns(:homonimo)
      ))
      Msip::Homonimo.where(persona1_id: persona1.id).delete_all
      persona1.destroy!
      persona2.destroy!
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      persona1 = Msip::Persona.create(
        id: 1,
        nombres: "nombre1",
        apellidos: "apellidos1",
        tdocumento_id: 11,
        numerodocumento: 1,
        sexo: "S",
      )

      assert_predicate persona1, :valid?

      post(dedup_ruta(homonimos_url), 
          params: { homonimo: {
            persona1_id: persona1.id,
            persona2_id: persona1.id,
            id: nil
          }})


      assert_template "new"
    end

    test "debe actualizar existente" do
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

      homonimo = Msip::Homonimo.create(
        personauno: persona1,
        personados: persona2,
      )

      assert_predicate homonimo, :valid?

      persona3 = Msip::Persona.create(
        id: 3,
        nombres: "nombre3",
        apellidos: "apellidos3",
        tdocumento_id: 11,
        numerodocumento: 3,
        sexo: "S",
      )

      assert_predicate persona3, :valid?

      patch dedup_ruta(homonimo_path(homonimo.id)),
        params: {
          homonimo: {
            id: homonimo.id,
            persona2_id: persona3.id
          },
        }

      assert_redirected_to dedup_ruta(homonimo_path(assigns(:homonimo)))

      homonimo.destroy!
      persona1.destroy!
      persona2.destroy!
      persona3.destroy!
    end

    test "crear presentar editar eliminar" do
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

      assert_difference("Msip::Homonimo.count") do
        post(dedup_ruta(homonimos_url), 
          params: { homonimo: {
            persona1_id: persona1.id,
            persona2_id: persona2.id,
            id: nil
          }})
      end

      assert_redirected_to dedup_ruta(homonimo_path(
        assigns(:homonimo)
      ))

      sign_in @current_usuario
      # Si no se hace nuevamente sign_in produce error:
      # CanCan::AccessDenied: No está autorizado para index Homonimo.

      get homonimos_path
      idr = response.body.match(/numregistros">[0-9]*/)[0][14..-1].to_i
      assert_equal 1, idr

      homonimo = Msip::Homonimo.all.take
      r = dedup_ruta(homonimo_url(homonimo))
      sign_in @current_usuario
      # Si no se hace nuevamente sign_in produce error:
      # CanCan::AccessDenied: No está autorizado para index Homonimo.

      get r

      assert_response :success
      assert_template :show

      sign_in @current_usuario
      get dedup_ruta(edit_homonimo_url(homonimo))

      assert_response :success
      assert_template :edit

      sign_in @current_usuario
      assert_difference("Homonimo.count", -1) do
        delete dedup_ruta(homonimo_path(Homonimo.find(homonimo.id)))
      end

      assert_redirected_to dedup_ruta(homonimos_path)

      persona1.destroy!
      persona2.destroy!

    end
  end
end
