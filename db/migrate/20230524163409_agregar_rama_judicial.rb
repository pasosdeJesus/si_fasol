class AgregarRamaJudicial < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO msip_grupoper
        (id, nombre, created_at, updated_at) VALUES
        (60, 'Rama Judicial', '2023-05-24', '2023-05-24');
      INSERT INTO msip_orgsocial
      (id, grupoper_id, tipoorg_id, subde_id, created_at, updated_at) VALUES
      (60, 60, 3, 30, '2023-05-24', '2023-05-24');
      UPDATE msip_orgsocial SET subde_id = 60
        WHERE id IN (32, 33, 34, 35, 36, 37, 313);
      UPDATE msip_grupoper SET nombre='Juzgados' where nombre='Jueces';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE msip_grupoper SET nombre='Jueces' where nombre='Juzgados';
      UPDATE msip_orgsocial SET subde_id = 30
        WHERE id IN (32, 33, 34, 35, 36, 37, 313);
      DELETE FROM msip_orgsocial WHERE id=60;
      DELETE FROM msip_grupoper WHERE id=60;
    SQL
  end
end
