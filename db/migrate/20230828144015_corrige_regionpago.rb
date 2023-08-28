class CorrigeRegionpago < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        11, 'NARIÑO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        18, 'CAUCA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        19, 'LA GUAJIRA', '2020-08-05', '2020-08-05', '2020-08-05');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM regionpago WHERE id IN (11, 18, 19);
    SQL
  end
end
