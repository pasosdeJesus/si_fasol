class CompletaCargos < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO cargoestado (id, nombre, fechacreacion, created_at, 
        updated_at) VALUES 
        (42, 'Agente de Producción', '2023-08-27', '2023-08-27', '2023-08-27');
      INSERT INTO cargoestado (id, nombre, fechacreacion, created_at, 
        updated_at) VALUES 
        (43, 'Coordinador(a) de Bienestar', '2023-08-27', '2023-08-27', '2023-08-27');
      INSERT INTO cargoestado (id, nombre, fechacreacion, created_at, 
        updated_at) VALUES 
        (44, 'Profesional', '2023-08-27', '2023-08-27', '2023-08-27');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM cargoestado WHERE id>=42 AND id<=44;
    SQL
  end
end
