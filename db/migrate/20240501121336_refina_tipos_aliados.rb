class RefinaTiposAliados < ActiveRecord::Migration[7.1]
  # Los aportantes se distinguen por tener aportes>0
  def up
    execute <<-SQL
      DELETE FROM tipoaliado WHERE id IN (5);
    SQL
  end
  def down
    execute <<-SQL
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, 'Funcionario institucional',
        '2024-04-08', '2024-04-08', '2024-04-08');
    SQL
  end
end
