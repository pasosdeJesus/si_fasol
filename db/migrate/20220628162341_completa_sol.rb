class CompletaSol < ActiveRecord::Migration[7.0]
  def change
    if !column_exists?(:sip_solicitud, :estadosol_id)
      add_column :sip_solicitud, :estadosol_id, :integer
    end
  end
end
