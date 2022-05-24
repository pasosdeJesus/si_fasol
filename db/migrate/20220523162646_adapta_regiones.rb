class AdaptaRegiones < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_region  SET fechadeshabilitacion='2022-05-23'
        WHERE id IN (6,7,9,10,11);
      INSERT INTO sivel2_gen_region (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (20, 'ANTIOQUIA', '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_region (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (21, 'SANTANDERES', '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_region (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (22, 'SUR', '2022-05-23', '2022-05-23', '2022-05-23');

    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_region WHERE id IN (20,21,22);
      UPDATE sivel2_gen_region  SET fechadeshabilitacion=NULL
        WHERE id IN (6,7,9,10,11);
    SQL
  end
end
