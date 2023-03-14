# frozen_string_literal: true

class ActualizaRangoEdad < ActiveRecord::Migration[7.0]
  def up
    execute(<<-SQL)
      DROP VIEW IF EXISTS tmp_acre;
      CREATE VIEW tmp_acre AS (
        SELECT sub2.*, r2.nombre#{" "}
        FROM (SELECT victima_id, victima_edad,#{" "}
          (SELECT id FROM sivel2_gen_rangoedad AS r#{" "}
            WHERE id=CASE#{" "}
              WHEN (r.limiteinferior IS NULL OR r.limiteinferior<=victima_edad)#{" "}
                AND (r.limitesuperior IS NULL OR r.limitesuperior>=victima_edad)#{" "}
              THEN r.id#{" "}
              ELSE 6#{" "}
            END LIMIT 1) AS victima_rangoedad#{"  "}
          FROM (SELECT v.id AS victima_id, public.sip_edad_de_fechanac_fecharef(
              p.anionac, p.mesnac, p.dianac, EXTRACT(year FROM c.fecha)::integer,
              EXTRACT(month FROM c.fecha)::integer,#{" "}
              EXTRACT(day FROM c.fecha)::integer) AS victima_edad#{" "}
            FROM sip_persona AS p#{" "}
            JOIN sivel2_gen_victima AS v ON v.id_persona=p.id#{" "}
            JOIN sivel2_gen_caso AS c ON v.id_caso=c.id)#{" "}
            AS sub)#{" "}
          AS sub2#{" "}
          JOIN sivel2_gen_rangoedad AS r2 ON r2.id=victima_rangoedad
      );

      UPDATE sivel2_gen_victima#{" "}
        SET id_rangoedad=victima_rangoedad
        FROM tmp_acre WHERE victima_id=id
      ;
      DROP VIEW IF EXISTS tmp_acre;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
