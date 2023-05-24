class EliminaFamiliaresReplicadosDeVictimas < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      DELETE FROM msip_persona_trelacion WHERE persona1=persona2;
    SQL
    pm = Msip::PersonaTrelacion.
      joins('JOIN msip_persona AS p1 ON p1.id=persona1').
      joins('JOIN msip_persona AS p2 ON p2.id=persona2').
      joins('JOIN sivel2_gen_victima AS v ON v.persona_id=p1.id').
      where('p1.nombres=p2.nombres').
      where('p1.apellidos=p2.apellidos')
    pm.each do |pt|
      p2 = pt.personados
      pt.destroy
      p2.destroy
    end
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
