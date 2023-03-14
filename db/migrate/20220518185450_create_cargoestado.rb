# frozen_string_literal: true

class CreateCargoestado < ActiveRecord::Migration[7.0]
  include Sip::SqlHelper

  def up
    create_table(:cargoestado) do |t|
      t.string(:nombre, limit: 500, null: false)
      t.string(:observaciones, limit: 5000)
      t.date(:fechacreacion, null: false)
      t.date(:fechadeshabilitacion)

      t.timestamps
    end
    cambiaCotejacion("cargoestado", "nombre", 500, "es_co_utf_8")
  end

  def down
    drop_table(:cargoestado)
  end
end
