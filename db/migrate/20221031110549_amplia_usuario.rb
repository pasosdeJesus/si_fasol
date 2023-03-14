# frozen_string_literal: true

class AmpliaUsuario < ActiveRecord::Migration[7.0]
  def change
    add_column(:usuario, :tdocumento_id, :integer)
    add_foreign_key(:usuario, :sip_tdocumento, column: :tdocumento_id)
    add_column(:usuario, :numerodocumento, :string, limit: 128)
    add_column(:usuario, :fechanac, :date)
    add_column(:usuario, :sexonac, :string, limit: 128)
  end
end
