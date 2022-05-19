class CamposFasolDb < ActiveRecord::Migration[7.0]
  def change
    add_column :sivel2_gen_caso, :ayudafasol, :string, limit: 1024
    add_column :sivel2_gen_caso, :codigofasol, :string, limit: 32
    add_column :sivel2_gen_caso, :marbetefasol, :string, limit: 256
  end
end
