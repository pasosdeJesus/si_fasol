class CompletaParaImprj < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO regionpago (id, nombre, fechacreacion, created_at, updated_at) VALUES
        (33, 'MAGDALENA', '2023-11-13', '2023-11-13', '2023-11-13');
      INSERT INTO regionpago (id, nombre, fechacreacion, created_at, updated_at) VALUES
        (34, 'BOYACA', '2023-11-13', '2023-11-13', '2023-11-13');
      INSERT INTO regionpago (id, nombre, fechacreacion, created_at, updated_at) VALUES
        (35, 'META', '2023-11-13', '2023-11-13', '2023-11-13');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM regionpago WHERE id>=33 AND id<=35;
    SQL
  end
end
