class CompletaSol < ActiveRecord::Migration[7.0]
  def change
    add_column :sip_solicitud, :estadosol_id, :integer
  end
end
