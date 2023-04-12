# frozen_string_literal: true

require "jos19/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Msip::ModelosController
    load_and_authorize_resource class: Msip::Persona

    include Jos19::Concerns::Controllers::PersonasController

    def atributos_show
      atributos_show_jos19 +
        [:familiarvictima_ids] -
        [:proyectofinanciero_ids]
    end

    def atributos_form
      atributos_form_jos19 - 
        [:familiarvictima_ids, :proyectofinanciero_ids]
    end

    def index_reordenar(c)
      c.reorder([:nombres, :apellidos])
    end

    def destroy
      if Sivel2Gen::Victima.where(persona_id: @registro.id).count == 0
        Msip::PersonaTrelacion.where(persona1: @registro.id).delete_all
        Msip::PersonaTrelacion.where(persona2: @registro.id).delete_all
      end
      destroy_gen
    end

    def filtro_personas_fechas(personas, cfecha = 'msip_persona.created_at')
      pfid = ''
      if (params[:nombresrepetidos] && params[:nombresrepetidos][:fechaini] && 
          params[:nombresrepetidos][:fechaini] != '')
        pfi = params[:nombresrepetidos][:fechaini]
        pfid = Msip::FormatoFechaHelper.fecha_local_estandar pfi
      else
        # Comenzar en semestre anterior
        pfid = Msip::FormatoFechaHelper.inicio_semestre(Date.today).to_s
      end
      personas = personas.where("#{cfecha} >= ?", pfid)
      if(params[:nombresrepetidos] && params[:nombresrepetidos][:fechafin] && 
          params[:nombresrepetidos][:fechafin] != '')
        pff = params[:nombresrepetidos][:fechafin]
        pffd = Msip::FormatoFechaHelper.fecha_local_estandar pff
        if pffd
          personas = personas.where("#{cfecha} <= ?", pffd)
        end
      end
      return personas
    end



    def consulta_nombresduplicados_autom
      depura = ''
      if ENV.fetch('DEPURA_MIN', -1).to_i > 0
        depura << " AND p1.id>#{ENV.fetch('DEPURA_MIN', -1).to_i}"
        depura << " AND p2.id>#{ENV.fetch('DEPURA_MIN', -1).to_i}"
      end
      if ENV.fetch('DEPURA_MAX', -1).to_i > 0
        depura << " AND p1.id<#{ENV.fetch('DEPURA_MAX', -1).to_i}"
        depura << " AND p2.id<#{ENV.fetch('DEPURA_MAX', -1).to_i}"
      end

      return Msip::Persona.connection.execute <<-SQL
      SELECT p1.tdocumento_id, p1.numerodocumento, 
        p1.id AS id1, p1.nombres AS nombres1, soundexespm(p1.nombres) AS sn1,
        p1.apellidos AS apellidos1, soundexespm(p1.apellidos) AS sa1,
        p2.id AS id2, p2.nombres AS nombres2, soundexespm(p2.nombres) AS sn2,
        p2.apellidos AS apellidos2, soundexespm(p2.apellidos) AS sa2
      FROM msip_persona AS p1
      JOIN msip_persona AS p2 
      ON p1.id<p2.id
        #{depura}
      WHERE
        (soundexespm(p1.nombres) = soundexespm(p2.nombres)
          AND soundexespm(p1.apellidos) = soundexespm(p2.apellidos)
        )  --con indices explain da 662.181
      --  OR 
      --  (((LENGTH(p2.nombres)>0 AND
      --      f_unaccent(p1.nombres) LIKE f_unaccent(p2.nombres) || '%')
      --    OR (LENGTH(p1.nombres)>0 AND
      --      f_unaccent(p2.nombres) LIKE f_unaccent(p1.nombres) || '%')
      --    )
      --   AND ((LENGTH(p2.apellidos)>0 AND
      --      f_unaccent(p1.apellidos) LIKE f_unaccent(p2.apellidos) || '%')
      --    OR (LENGTH(p1.apellidos)>0 AND
      --      f_unaccent(p2.apellidos) LIKE f_unaccent(p1.apellidos) || '%')
      --   )
      -- ) --no susceptible de indices con explain da 5'574.709.919
      --  OR 
      --  (levenshtein(p1.nombres || ' ' ||
      --      p1.apellidos,
      --      p2.nombres || ' ' ||
      --      p2.apellidos) <= 3
      --  ) --no encontramos como indexar con explain da 4'612.693.352
    ;
      SQL
      # Las 3 opciones sin igualdad entre tdocumento y numerodocumento da
      # 23'700.306.841 (mucho más que la suma de las opciones)
    end


    def nombresrepetidos
      debugger
      @validaciones = []
      personas = Msip::Persona.all
      puts "OJO 1 personas.count=#{personas.count}"
      personas = filtro_personas_fechas(personas)
      res= "SELECT sub2.sigla, sub2.numerodocumento, sub2.rep, "\
        "     sub2.identificaciones[1:5] as identificaciones5, "\
        "     ARRAY(SELECT DISTINCT ac.id"\
        "     FROM cor1440_gen_asistencia AS asi"\
        "     JOIN cor1440_gen_actividad AS ac ON ac.id=asi.actividad_id "\
        "     WHERE asi.persona_id = ANY(sub2.identificaciones[2:]) "\
        "     ) AS actividades_ben,\n"\
        "     ARRAY(SELECT DISTINCT usuario.nusuario "\
        "     FROM cor1440_gen_asistencia AS asi"\
        "     JOIN msip_persona AS p2 ON p2.id=asi.persona_id "\
        "       AND p2.id = ANY(sub2.identificaciones[2:]) "\
        "     JOIN cor1440_gen_actividad AS ac ON ac.id=asi.actividad_id "\
        "     JOIN msip_bitacora AS bit ON bit.modelo='Cor1440Gen::Actividad' "\
        "       AND bit.modelo_id=ac.id "\
        "       AND DATE_PART('minute', bit.fecha-p2.created_at)<10 "\
        "     JOIN usuario ON usuario.id=bit.usuario_id "\
        "     ) AS posibles_rep\n"\
        "FROM ("\
        "     SELECT sub.sigla, sub.tdocumento_id, sub.numerodocumento, sub.rep, \n"\
        "    ARRAY(SELECT id FROM (" + personas.to_sql + ") AS p2\n"\
        "        WHERE (p2.tdocumento_id=sub.tdocumento_id OR (sub.tdocumento_id IS NULL AND p2.tdocumento_id IS NULL))\n"\
        "        AND (p2.numerodocumento=sub.numerodocumento OR (sub.numerodocumento IS NULL AND p2.numerodocumento IS NULL))\n"\
        "        ORDER BY id) AS identificaciones\n"\
        "  FROM (SELECT t.sigla, p.tdocumento_id, numerodocumento,\n"\
        "      COUNT(p.id) AS rep "\
        "      FROM (" + personas.to_sql + ") AS p\n"\
        "      LEFT JOIN msip_tdocumento as t ON t.id=tdocumento_id\n"\
        "      GROUP BY 1,2,3) AS sub\n"\
        "  WHERE rep>1\n"\
        "  ORDER BY rep DESC) AS sub2";
      arr = ActiveRecord::Base.connection.select_all(res)
      @validaciones << { 
        titulo: 'Identificaciones repetidas de personasiciarios actualizados en el rango de fechas',
        encabezado: ['Tipo Doc.', 'Núm. Doc.', 'Num. personas', 
                     'Ids 5 primeras personas', 'Ids Actividades', 
                     'Editores Act. cerca a ingreso personas'],
        cuerpo: arr 
      }


      if params && params[:nombrerepetido] && 
          params[:nombrerepetido][:deduplicables_autom] == '1'
        arr = ActiveRecord::Base.connection.select_all(
          UnificarHelper.consulta_casos_por_arreglar.select(['id']).to_sql
        )
        @validaciones << {
          titulo: 'Casos parcialmente eliminados por arreglar (completar o eliminar)',
          encabezado: ['Id.'],
          cuerpo: arr 
        }


        arr = ActiveRecord::Base.connection.select_all(
          UnificarHelper.consulta_casos_en_blanco.select(['caso_id']).to_sql
        )
        @validaciones << {
          titulo: 'Casos en blanco por eliminar automaticamente',
          encabezado: ['Id.'],
          cuerpo: arr 
        }

        arr = ActiveRecord::Base.connection.select_all(
          UnificarHelper.consulta_personas_en_blanco_por_eliminar.select(['id']).to_sql
        )
        @validaciones << {
          titulo: 'Personas en blanco por eliminar automaticamente',
          encabezado: ['Id.'],
          cuerpo: arr 
        }

        pares = consulta_paresduplicados_autom
        vc = {
          titulo: 'Beneficarios por intentar deduplicar automaticamente',
          encabezado: [
            'T. Doc', 'Num. doc', 'Id1', 'Nombres', 'Apellidos',
            'Id2', 'Nombres', 'Apellidos'
          ],
          cuerpo: []
        }
        pares.each do |f|
          vc[:cuerpo] << [['sigla',f['sigla']], ['numerodocumento', f['numerodocumento']],
                          ['id1', f['id1']], ['nombres1', f['nombres1']], 
                          ['apellidos1', f['apellidos1']],
                          ['id2', f['id2']], ['nombres2', f['nombres2']], 
                          ['apellidos2', f['apellidos2']] ]
        end
        @validaciones << vc
      end

      rep= "SELECT p1.id AS id1, t1.sigla, p1.numerodocumento, "\
        "     p1.nombres AS nombres1, p1.apellidos AS apellidos1,"\
        "     p2.id AS id2, t2.sigla, p2.numerodocumento, "\
        "     p2.nombres AS nombres2, p2.apellidos AS apellidos2"\
        "   FROM msip_persona AS p1"\
        "   JOIN msip_persona AS p2 ON p1.id < p2.id "\
        "   JOIN msip_tdocumento AS t1 ON p1.tdocumento_id=t1.id "\
        "   JOIN msip_tdocumento AS t2 ON p2.tdocumento_id=t2.id " \
        "   WHERE soundexespm(p1.nombres)=soundexespm(p2.nombres) AND "\
        "   soundexespm(p1.apellidos)=soundexespm(p2.apellidos) "\
        "   ORDER BY p1.nombres, p1.apellidos, p2.nombres, p2.apellidos"
      @idrep = ActiveRecord::Base.connection.select_all(rep) 

      render :nombresrepetidos, layout: 'application'
    end
  end
end
