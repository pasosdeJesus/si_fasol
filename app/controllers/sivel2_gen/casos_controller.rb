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
          { titulo: "Víctimas", parcial: "victimas" },
          { titulo: "Ubicación", parcial: "ubicaciones" },
          { titulo: "Fuentes", parcial: "fotras" },
          { titulo: "Contexto", parcial: "contextos" },
          { titulo: "Presuntos Responsables", parcial: "presponsables" },
          { titulo: "Actos", parcial: "actos" },
          { titulo: "Descripción", parcial: "memo" },
          { titulo: "Anexos", parcial: "sivel2_gen/casos/anexos" },
          { titulo: "Respuesta", parcial: "respuesta" },
          { titulo: "Etiquetas", parcial: "etiquetas_sin_sol" },
        ]
      else
        []
      end
    end

    def numcasos
      render(json: Conscaso.count, status: :ok)
    end

    def campos_filtro1
      if current_usuario
        [:departamento_id, :municipio_id, :clase_id,
         :fechaini, :fechafin, :presponsable_id, :categoria_id,
         :nombres, :apellidos, :victimacol, :sexo, :rangoedad_id,
         :organizacion_id, :profesion_id, :filiacion_id, :descripcion,
         :usuario_id, :fechaingini, :fechaingfin, :contexto_id, 
         :contextovictima_id, :codigo, :orientacionsexual,
         :sectorsocial_id, :tdocumento_id, :numerodocumento
        ]
      else
        [:departamento_id, :municipio_id, :clase_id,
         :fechaini, :fechafin, :presponsable_id, :categoria_id,
         :nombres, :apellidos, :sexo, :rangoedad_id, :descripcion, 
         :sectorsocial_id 
        ]
      end
    end

    def campoord_inicial
      "fecha"
    end

    def lista_params
      l = lista_params_sivel2_gen
      l[l.count - 1][:victima_attributes].delete(:vinculoestado_id)
      l[l.count - 1][:victima_attributes].unshift(:entidad_id)
      l[l.count - 1][:victima_attributes].unshift(:detallevinculoestado)
      l[l.count - 1][:victima_attributes].unshift(:cargoestado_id)
      l.unshift(:ayudafasol)
      l.unshift(:codigofasol)
      l.unshift(:marbetefasol)
      l[l.count - 1][:acto_attributes].unshift(:fecha)

      l
    end
  end
end
