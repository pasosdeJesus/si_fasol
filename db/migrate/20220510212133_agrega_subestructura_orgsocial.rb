# frozen_string_literal: true

class AgregaSubestructuraOrgsocial < ActiveRecord::Migration[7.0]
  def change
    add_column(:sip_orgsocial, :subde_id, :integer)
    add_foreign_key(:sip_orgsocial, :sip_orgsocial, column: :subde_id)
  end
end
