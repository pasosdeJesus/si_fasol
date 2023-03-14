# frozen_string_literal: true

class Observacionencaso < ActiveRecord::Migration[7.0]
  def change
    add_column(:sivel2_gen_caso, :observacionfasol, :string, limit: 1024)
  end
end
