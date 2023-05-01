class EtiquetaUnificados < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO msip_etiqueta 
      (id, nombre, observaciones, fechacreacion, created_at, updated_at) VALUES
      (20, 'PERSONAS UNIFICADAS', '', '2023-04-28', '2023-04-28', '20230-04-28');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM msip_etiqueta WHERE id=20;
    SQL
  end
end
