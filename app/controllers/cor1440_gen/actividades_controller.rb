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
        :poblacion,
        :anexos,
      ]
    end

    def registrar_en_bitacora
      true
    end

    def otros_impedimentos_para_borrar_persona_ex_asistente(a)
      # Estar como víctima en un caso es impedimento
      if Sivel2Gen::Victima.where(persona_id: a.persona_id).count > 0
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


    # Responde a requerimiento AJAX generado por cocoon creando una
    # nueva persona como nuevo asistente para la actividad que recibe
    # por parámetro  params[:actividad_id].
    # Pone valores NN en los campos requeridos.
    #
    # Como crea personas que podrían ser remplazadas por otras por
    # autocompletación. Los NN creados son eliminados
    # en filtra_contenido_params
    def nuevo_aliadoasiste
      authorize!(:new, Msip::Persona)
      if params[:actividad_id].nil?
        resp_error("Falta parámetro actividad_id")
        return
      end
      puts "** cuenta: #{Cor1440Gen::Actividad.where(id: params[:actividad_id].to_i).count}"
      if Cor1440Gen::Actividad.where(id: params[:actividad_id].to_i).count == 0
        reps_error("No se encontró actividad " +
                   params[:actividad_id].to_i.to_s)
        return
      end
      act = Cor1440Gen::Actividad.find(params[:actividad_id].to_i)
      @persona = Msip::Persona.create(
        nombres: "N",
        apellidos: "N",
        sexo: "S",
        tdocumento_id: 11,
        numerodocumento: "AAA",
      )
      @persona.save(validate: false)
      @persona.numerodocumento = @persona.id
      unless @persona.save
        resp_error("No pudo crear persona")
        return
      end

      @aliadoasiste = ::Aliadoasiste.create(
        actividad_id: act.id,
        persona_id: @persona.id,
      )
      unless @aliadoasiste.save
        resp_error("No pudo crear aliado")
        @persona.destroy
        return
      end
      res = {
        "aliadoasiste": @aliadoasiste.id.to_s,
        "persona": @persona.id.to_s,
      }.to_json
      respond_to do |format|
        format.js { render(text: res) }
        format.json do
          render(
            json: res,
            status: :created,
          )
        end
        format.html { render(inline: res) }
      end
    end # def nuevo_aliadoasiste


    def lista_params
      l = lista_params_cor1440_gen
      l[-1][:asistencia_attributes][-1][:opcioncaracterizacion_ids] = []
      l[-1][:asistencia_attributes].insert(0, :numsesiones)
      l[-1][:asistencia_attributes][-1][:persona_attributes].insert(
        0, :tipoaliado_id
      )
      l 
    end
  end # class
end # module
