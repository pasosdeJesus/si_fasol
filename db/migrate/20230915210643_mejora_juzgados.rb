class MejoraJuzgados < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE msip_orgsocial SET tipoorg_id=3 WHERE id>=5301 AND id<=9702;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE msip_orgsocial SET tipoorg_id=2 WHERE id>=5301 AND id<=9702;
    SQL
  end
end
