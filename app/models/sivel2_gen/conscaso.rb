
require 'sivel2_gen/concerns/models/conscaso'

module Sivel2Gen 
  class Conscaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Conscaso

    scope :filtro_tdocumento_id, lambda { |tid|
      where("caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.msip_persona
                    ON sivel2_gen_victima.persona_id=msip_persona.id
                    WHERE msip_persona.tdocumento_id=?)", tid.to_i)
    }

    scope :filtro_numerodocumento, lambda { |numd|
      where("caso_id IN (SELECT caso_id
                    FROM public.sivel2_gen_victima 
                    INNER JOIN public.msip_persona
                    ON sivel2_gen_victima.persona_id=msip_persona.id
                    WHERE msip_persona.numerodocumento LIKE ('%' || ? || '%'))", numd)
    }


    def self.consulta_base
      return "SELECT caso.id as caso_id, caso.fecha, caso.memo, 
        ARRAY_TO_STRING(ARRAY(SELECT COALESCE(departamento.nombre, '') ||  
        ' / ' || COALESCE(municipio.nombre, '')
        FROM public.msip_ubicacion AS ubicacion 
          LEFT JOIN public.msip_departamento AS departamento 
            ON (ubicacion.departamento_id = departamento.id)
          LEFT JOIN public.msip_municipio AS municipio 
            ON (ubicacion.municipio_id=municipio.id)
          WHERE ubicacion.caso_id=caso.id), ', ')
        AS ubicaciones, 
        ARRAY_TO_STRING(ARRAY(SELECT nombres || ' ' || apellidos ||
        ' - ' || tdocumento.sigla || ' ' || persona.numerodocumento
          FROM public.msip_persona AS persona
          JOIN public.sivel2_gen_victima AS victima
          ON persona.id=victima.persona_id
          JOIN public.msip_tdocumento AS tdocumento
          ON tdocumento.id=persona.tdocumento_id
          WHERE victima.caso_id=caso.id), ', ')
        AS victimas, 
        ARRAY_TO_STRING(ARRAY(SELECT nombre 
          FROM public.sivel2_gen_presponsable AS presponsable, 
          public.sivel2_gen_caso_presponsable AS caso_presponsable
          WHERE presponsable.id=caso_presponsable.presponsable_id
          AND caso_presponsable.caso_id=caso.id), ', ')
        AS presponsables, 
        ARRAY_TO_STRING(ARRAY(SELECT supracategoria.tviolencia_id || ':' || 
          categoria.supracategoria_id || ':' || categoria.id || ' ' ||
          categoria.nombre FROM public.sivel2_gen_categoria AS categoria, 
          public.sivel2_gen_supracategoria AS supracategoria,
          public.sivel2_gen_acto AS acto
          WHERE categoria.id=acto.categoria_id
          AND supracategoria.id=categoria.supracategoria_id
          AND acto.caso_id=caso.id), ', ')
        AS tipificacion
        FROM public.sivel2_gen_caso AS caso"
    end

  end
end
