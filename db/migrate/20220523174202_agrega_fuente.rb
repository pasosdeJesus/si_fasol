class AgregaFuente < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO sip_fuenteprensa (id, tfuente, nombre, 
        fechacreacion, created_at, updated_at) VALUES 
        (30, 'Directa', 'FASOL', 
        '2022-05-23', '2022-05-23', '2022-05-23');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sip_fuenteprensa WHERE id=30;
    SQL
  end
end
