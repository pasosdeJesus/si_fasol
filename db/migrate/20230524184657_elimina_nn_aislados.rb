class EliminaNnAislados < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      DELETE FROM msip_persona AS p WHERE nombres='N'
        AND apellidos='N'
        AND id NOT IN (SELECT persona1 FROM msip_persona_trelacion)
        AND id NOT IN (SELECT persona2 FROM msip_persona_trelacion)
        AND id NOT IN (SELECT persona_id FROM sivel2_gen_acto)
        AND id NOT IN (SELECT persona_id FROM sivel2_gen_victima)
        AND id NOT IN (SELECT persona_id FROM aliadoasiste)
        ;
    SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
