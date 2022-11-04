class CreateOpcioncaracterizacion < ActiveRecord::Migration[7.0]
  include Sip::SqlHelper
  def up
    create_table :cor1440_gen_opcioncaracterizacion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.column :actividadpf_id, :integer
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    cambiaCotejacion('cor1440_gen_opcioncaracterizacion', 
                     'nombre', 500, 'es_co_utf_8')
    add_foreign_key :cor1440_gen_opcioncaracterizacion, 
      :cor1440_gen_actividadpf, column: :actividadpf_id
  end

  def down
    drop_table :cor1440_gen_opcioncaracterizacion
  end
end
