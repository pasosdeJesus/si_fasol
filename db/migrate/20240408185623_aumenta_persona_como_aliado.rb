class AumentaPersonaComoAliado < ActiveRecord::Migration[7.1]
  def change
    add_column :msip_persona, :tipoaliado_id, :integer
    add_column :msip_persona, :detallealiado, :string, limit: 1000
    add_foreign_key :msip_persona, :tipoaliado
  end
end
