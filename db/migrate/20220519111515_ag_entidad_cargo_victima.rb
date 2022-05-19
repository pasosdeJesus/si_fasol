class AgEntidadCargoVictima < ActiveRecord::Migration[7.0]
  def change
    add_column :sivel2_gen_victima, :cargoestado_id, :integer
    add_foreign_key :sivel2_gen_victima, :cargoestado
    add_column :sivel2_gen_victima, :entidad_id, :integer
    add_foreign_key :sivel2_gen_victima, :sip_orgsocial, column: :entidad_id
    add_column :sivel2_gen_victima, :detallevinculoestado, :string, limit: 512
  end
end
