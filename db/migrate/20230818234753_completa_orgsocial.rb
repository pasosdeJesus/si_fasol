class CompletaOrgsocial < ActiveRecord::Migration[7.0]
  def change
    add_column :msip_orgsocial, :numminjusticia, :integer
    add_column :msip_orgsocial, :idminjusticia, :integer
    add_column :msip_orgsocial, :horario, :string, limit: 255
  end
end
