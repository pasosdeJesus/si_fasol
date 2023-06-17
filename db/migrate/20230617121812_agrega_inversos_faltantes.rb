class AgregaInversosFaltantes < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE msip_persona_trelacion
        SET observaciones = 'Asegurando inverso automaticamente. ' || 
          COALESCE(observaciones, '')
      ;
    SQL
  end
  def down
  end
end
