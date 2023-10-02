class FechaDesafiliacionAportante < ActiveRecord::Migration[7.0]
  def up
    add_column :msip_persona, :fecha_desafiliacion_aportante, :date
  end
  def down
    remove_column :msip_persona, :fecha_desafiliacion_aportante, :date
  end
end
