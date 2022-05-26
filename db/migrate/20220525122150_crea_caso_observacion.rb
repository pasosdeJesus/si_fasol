class CreaCasoObservacion < ActiveRecord::Migration[7.0]
  def change
    create_table :sivel2_gen_caso_observacion do |t|
      t.integer :caso_id, null: false
      t.integer :observacion_id, null: false
      t.index :caso_id
      t.index :observacion_id
    end
    add_foreign_key :sivel2_gen_caso_observacion, 
      :sivel2_gen_caso, column: :caso_id
    add_foreign_key :sivel2_gen_caso_observacion, :sip_observacion, 
      column: :observacion_id
  end
end
