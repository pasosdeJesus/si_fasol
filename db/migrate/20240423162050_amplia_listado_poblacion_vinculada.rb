class AmpliaListadoPoblacionVinculada < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      UPDATE heb412_gen_campoplantillahcm SET columna='F',
        nombrecampo='fechanac_localizada'
        WHERE id=535; --Fecha de nacimiento en F
      UPDATE heb412_gen_campoplantillahcm SET columna='G'
        WHERE id=534; --Sexo en G
    SQL
    Heb412Gen::PlantillaHelper.inserta_columna(102, 560, 'M', 'etiquetas')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 561, 'N', 'cuenta_actividades')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 562, 'O', 'cuenta_casos')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 563, 'P', 'cuenta_familiar_victima')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 564, 'Q', 'tipoaliado')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 565, 'R', 'ultimo_aporte')
    Heb412Gen::PlantillaHelper.inserta_columna(102, 566, 'S', 'aportes')
  end

  def down
    Heb412Gen::PlantillaHelper.elimina_columna(102, 566)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 565)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 564)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 563)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 562)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 561)
    Heb412Gen::PlantillaHelper.elimina_columna(102, 560)

    execute <<-SQL
      UPDATE heb412_gen_campoplantillahcm SET columna='G',
        nombrecampo='fechanac'
        WHERE id=535; --Fecha de nacimiento en G
      UPDATE heb412_gen_campoplantillahcm SET columna='F'
        WHERE id=534; --Sexo en F
    SQL
  end

end
