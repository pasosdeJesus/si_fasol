class IndicesAporte < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE INDEX i_aporte_anio ON
        aporte (anio);
      CREATE INDEX i_aporte_mes ON
        aporte (mes);
      CREATE INDEX i_aporte_persona ON
        aporte (persona_id);
      CREATE INDEX i_aporte_anio_mes ON
        aporte (anio, mes);
      CREATE UNIQUE INDEX i_aporte_anio_mes_persona ON
        aporte (anio, mes, persona_id);
    SQL
  end
  def down
    execute <<-SQL
      DROP INDEX i_aporte_anio;
      DROP INDEX i_aporte_mes;
      DROP INDEX i_aporte_persona;
      DROP INDEX i_aporte_anio_mes;
      DROP UNIQUE INDEX i_aporte_anio_mes_persona;
    SQL
  end

end
