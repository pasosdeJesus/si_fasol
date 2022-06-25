class RenombraTablaObservacion < ActiveRecord::Migration[7.0]
  def change
    rename_table :sip_observacion, :sip_solicitud
    rename_column :sip_solicitud, :observacion, :solicitud
    rename_table :sivel2_gen_caso_observacion, :sivel2_gen_caso_solicitud
    rename_column :sivel2_gen_caso_solicitud, :observacion_id, :solicitud_id
  end
end
