class CreateAliadoasiste < ActiveRecord::Migration[7.0]
  def change
    create_table :aliadoasiste do |t|
      t.integer :persona_id
      t.integer :actividad_id
      t.integer :entidad_id
      t.integer :cargoestado_id
      t.string :telefono, limit: 30
      t.string :correo, limit: 60
      t.string :observaciones, limit: 5000

      t.timestamps
    end
    add_foreign_key :aliadoasiste, :msip_persona, column: :persona_id
    add_foreign_key :aliadoasiste, :cor1440_gen_actividad, column: :actividad_id
    add_foreign_key :aliadoasiste, :msip_orgsocial, column: :entidad_id
    add_foreign_key :aliadoasiste, :cargoestado
  end
end
