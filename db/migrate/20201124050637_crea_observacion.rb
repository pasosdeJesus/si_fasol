class CreaObservacion < ActiveRecord::Migration[6.0]
  def up
    create_table :sip_observacion do |t|
      t.integer :usuario_id, null: false
      t.date :fecha, null: false
      t.string :observacion, limit: 5000
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sip_observacion, :usuario, column: :usuario_id
  end

  def down
    drop_table :sip_observacion
  end
end
