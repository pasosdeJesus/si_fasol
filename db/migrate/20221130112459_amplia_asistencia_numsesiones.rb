# frozen_string_literal: true

class AmpliaAsistenciaNumsesiones < ActiveRecord::Migration[7.0]
  def change
    add_column(:cor1440_gen_asistencia, :numsesiones, :integer)
  end
end
