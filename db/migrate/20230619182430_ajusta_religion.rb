class AjustaReligion < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_iglesia SET fechadeshabilitacion='2023-06-19' 
        WHERE id NOT IN (1, 10, 47);
      UPDATE sivel2_gen_iglesia
        SET nombre='Cristiana/Evangélica'
        WHERE id=10;
      UPDATE sivel2_gen_iglesia
        SET nombre='Católica'
        WHERE id=47;
        INSERT INTO sivel2_gen_iglesia (id, nombre, fechacreacion, created_at, updated_at) 
          VALUES (95, 'Áteo', '2023-06-19', '2023-06-19', '2023-06-19');
        INSERT INTO sivel2_gen_iglesia (id, nombre, fechacreacion, created_at, updated_at) 
          VALUES (96, 'Testigo de Jehova', '2023-06-19', '2023-06-19', '2023-06-19');
        INSERT INTO sivel2_gen_iglesia (id, nombre, fechacreacion, created_at, updated_at) 
          VALUES (97, 'Judío', '2023-06-19', '2023-06-19', '2023-06-19');
        INSERT INTO sivel2_gen_iglesia (id, nombre, fechacreacion, created_at, updated_at) 
          VALUES (98, 'Musulmán', '2023-06-19', '2023-06-19', '2023-06-19');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_iglesia WHERE id>=95 AND id<=98;
      UPDATE sivel2_gen_iglesia
        SET nombre='IGLESIA CATÓLICA'
        WHERE id=47;
      UPDATE sivel2_gen_iglesia
        SET nombre='IGLESIA CRISTIANA NO IDENTIFICADA'
        WHERE id=10;
      UPDATE sivel2_gen_iglesia SET fechadeshabilitacion=NULL
        WHERE fechadeshabilitacion='2023-06-19';
    SQL
  end
end
