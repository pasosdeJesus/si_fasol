# frozen_string_literal: true

class CreaAsistenciaOpcioncaracterizacion < ActiveRecord::Migration[7.0]
  def change
    create_table(:cor1440_gen_asistencia_opcioncaracterizacion) do |t|
      t.column(:asistencia_id, :integer)
      t.column(:opcioncaracterizacion_id, :integer)
    end
    add_foreign_key(
      :cor1440_gen_asistencia_opcioncaracterizacion,
      :cor1440_gen_asistencia,
      column: :asistencia_id,
    )
    add_foreign_key(
      :cor1440_gen_asistencia_opcioncaracterizacion,
      :cor1440_gen_opcioncaracterizacion,
      column: :opcioncaracterizacion_id,
    )
  end
end
