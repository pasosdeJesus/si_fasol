# frozen_string_literal: true

require "cor1440_gen/concerns/controllers/actividades_controller"

module Cor1440Gen
  class ActividadesController < Heb412Gen::ModelosController
    before_action :set_actividad,
      only: [:show, :edit, :update, :destroy],
      exclude: [:contar, :contar_beneficiarios]
    load_and_authorize_resource class: Cor1440Gen::Actividad

    include Cor1440Gen::Concerns::Controllers::ActividadesController

    def atributos_show
      [
        :id,
        :fecha_localizada,
        :nombre,
        :lugar,
        :responsable,
        :corresponsables,
        :proyectofinanciero,
        :actividadpf,
        :respuestafor,
        :objetivo,
        :resultado,
        # :orgsocial,  -- por la cantidad de organizaicones hace muy lenta
        # la carga, cambiar por autocompletación
        :listadoasistencia,
        :listadoaliadosasisten,
        :poblacion,
        :anexos,
      ]
    end

    def otros_impedimentos_para_borrar_persona_ex_asistente(a)
      # Estar como víctima en un caso es impedimento
      if Sivel2Gen::Victima.where(id_persona: a.persona_id).count > 0
        return true
      end

      false
    end

    def otras_acciones_antes_eliminar_asistencia(a)
      if a.opcioncaracterizacion
        a.opcioncaracterizacion.destroy_all
      end
    end

    def destroy
      opc = Cor1440Gen::AsistenciaOpcioncaracterizacion
        .joins(
          "JOIN cor1440_gen_asistencia ON cor1440_gen_asistencia.id="\
            "cor1440_gen_asistencia_opcioncaracterizacion.asistencia_id",
        ).where(
          "cor1440_gen_asistencia.actividad_id": @registro.id,
        )
      if opc.count > 0
        opc.destroy_all
      end

      [
        "Cor1440Gen::ActividadareasActividad",
        "Cor1440Gen::ActividadActividadpf",
        "Cor1440Gen::ActividadActividadtipo",
        "Cor1440Gen::ActividadOrgsocial",
        "Cor1440Gen::ActividadProyecto",
        "Cor1440Gen::ActividadProyectofinanciero",
        "Cor1440Gen::ActividadRangoedadac",
        "Cor1440Gen::ActividadRespuestafor",
        "Cor1440Gen::ActividadAnexo",
        "Cor1440Gen::ActividadUsuario",
        "Cor1440Gen::Asistencia",
      ].each do |relac|
        r = relac.constantize.where(actividad_id: @registro.id)
        r.delete_all if r.count > 0
      end

      rpb = @registro.respuestafor_ids
      puts "** OJO por borrar respuestafor: #{rpb}"
      if rpb.count > 0
        Cor1440Gen::ActividadRespuestafor.connection.execute(<<-EOF)
          DELETE FROM cor1440_gen_actividad_respuestafor#{" "}
          WHERE actividad_id=#{@registro.id};
          DELETE FROM mr519_gen_valorcampo#{" "}
          WHERE respuestafor_id IN (#{rpb.join(",")});
          DELETE FROM mr519_gen_respuestafor#{" "}
          WHERE id IN (#{rpb.join(",")});
        EOF
      end

      # destroy_cor1440_gen
      destroy_gen
    end

    def lista_params
      l = lista_params_cor1440_gen
      l[-1][:asistencia_attributes][-1][:opcioncaracterizacion_ids] = []
      l[-1][:asistencia_attributes].insert(0, :numsesiones)
      l
    end
  end # class
end # module
