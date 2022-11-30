class AsistenciaCaracterizacionDePfcomunes < ActiveRecord::Migration[7.0]
  def up
    execute <<~SQL
      UPDATE cor1440_gen_asistencia_opcioncaracterizacion 
        SET opcioncaracterizacion_id = NULL;
    SQL
    remove_foreign_key :cor1440_gen_asistencia_opcioncaracterizacion, 
      :cor1440_gen_opcioncaracterizacion, column: :opcioncaracterizacion_id
    add_foreign_key :cor1440_gen_asistencia_opcioncaracterizacion, 
      :cor1440_gen_actividadpf, column: :opcioncaracterizacion_id
  end

  def down
    remove_foreign_key :cor1440_gen_asistencia_opcioncaracterizacion, 
      :cor1440_gen_actividadpf, column: :opcioncaracterizacion_id
    add_foreign_key :cor1440_gen_asistencia_opcioncaracterizacion, 
      :cor1440_gen_opcioncaracterizacion, column: :opcioncaracterizacion_id
  end
end
