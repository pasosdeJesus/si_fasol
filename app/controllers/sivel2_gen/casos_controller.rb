# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/casos_controller"

module Sivel2Gen
  class CasosController < Heb412Gen::ModelosController
    include Sivel2Gen::Concerns::Controllers::CasosController

    before_action :set_caso, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sivel2Gen::Caso,
      except: [:index, :show, :mapaosm, :update]

    include Sivel2Gen::Concerns::Controllers::CasosController

    def pestanas_formulariocaso
      # byebug
      if current_usuario && can?(:solocambiaretiquetas, Sivel2Gen::Caso)
        [
          { titulo: "Etiquetas", parcial: "etiquetas_sin_sol" },
        ]
      elsif current_usuario && can?(:update, Sivel2Gen::Caso)
        [
          { titulo: "Datos Básicos", parcial: "basicos" },
          { titulo: "Ubicación", parcial: "ubicaciones" },
          { titulo: "Fuentes Frecuentes", parcial: "fuentesprensa" },
          { titulo: "Otras Fuentes", parcial: "fotras" },
          { titulo: "Contexto", parcial: "contextos" },
          { titulo: "Presuntos Responsables", parcial: "presponsables" },
          { titulo: "Víctimas", parcial: "victimas" },
          { titulo: "Víctimas Colectivas", parcial: "victimascolectivas" },
          { titulo: "Combatientes", parcial: "combatientes" },
          { titulo: "Actos", parcial: "actos" },
          { titulo: "Descripción", parcial: "memo" },
          { titulo: "Anexos", parcial: "sivel2_gen/casos/anexos" },
          { titulo: "Respuesta", parcial: "respuesta" },
          { titulo: "Etiquetas", parcial: "etiquetas_sin_sol" },
          { titulo: "Evaluación", parcial: "evaluacion" },
        ]
      else
        []
      end
    end

    def numcasos
      render(json: Conscaso.count, status: :ok)
    end

    def campoord_inicial
      "fecha"
    end

    def lista_params
      l = lista_params_sivel2_gen
      l[l.count - 1][:victima_attributes].delete(:id_vinculoestado)
      l[l.count - 1][:victima_attributes].unshift(:entidad_id)
      l[l.count - 1][:victima_attributes].unshift(:detallevinculoestado)
      l[l.count - 1][:victima_attributes].unshift(:cargoestado_id)
      l.unshift(:ayudafasol)
      l.unshift(:codigofasol)
      l.unshift(:marbetefasol)

      l
    end
  end
end
