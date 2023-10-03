class ArreglaEntidadNuevosFiscalia < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE msip_persona
        SET ultima_entidad_id=31
      WHERE id IN (SELECT persona_id FROM aporte WHERE valor>0)
        AND ultima_entidad_id IS NULL;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
