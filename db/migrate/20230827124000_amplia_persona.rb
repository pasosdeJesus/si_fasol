class AmpliaPersona < ActiveRecord::Migration[7.0]
  def change
    add_column :msip_persona, :ultimo_departamento_trabajo_id, :integer
    add_column :msip_persona, :ultima_regionpago_id, :integer
    add_column :msip_persona, :ultimo_correo_trabajo, :string, limit: 128
    add_column :msip_persona, :ultimo_celular_trabajo, :string, limit: 128
    add_column :msip_persona, :ultima_entidad_id, :integer
    add_column :msip_persona, :ultimo_cargoestado_id, :integer

    add_foreign_key :msip_persona, :msip_departamento, 
      column: :ultimo_departamento_trabajo_id
    add_foreign_key :msip_persona, :regionpago, 
      column: :ultima_regionpago_id
    add_foreign_key :msip_persona, :msip_orgsocial,
      column: :ultima_entidad_id
    add_foreign_key :msip_persona, :cargoestado,
      column: :ultimo_cargoestado_id
  end
end
