class Aporte < ActiveRecord::Migration[7.0]
  def change
    create_table :aporte do |t|
      t.integer :persona_id, null: false
      t.integer :anio, null: false
      t.integer :mes, null: false
      t.integer :valor, null: false
    end
    add_foreign_key :aporte, :msip_persona, column: :persona_id
  end
end
