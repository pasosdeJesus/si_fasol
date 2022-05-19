class Entsininfo < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:sivel2_gen_victima, :cargoestado_id, 
                          from: nil, to: 1)
  end
end
