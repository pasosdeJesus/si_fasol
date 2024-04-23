class CambiaCompDonAnio < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      UPDATE heb412_gen_campoplantillahcr SET nombrecampo='añoanterior'
        WHERE id=353;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_enero_añoanterior' WHERE id=354;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_febrero_añoanterior' WHERE id=355;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_marzo_añoanterior' WHERE id=356;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_abril_añoanterior' WHERE id=357;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_mayo_añoanterior' WHERE id=358;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_junio_añoanterior' WHERE id=359;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_julio_añoanterior' WHERE id=360;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_agosto_añoanterior' WHERE id=361;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_septiembre_añoanterior' WHERE id=362;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_octubre_añoanterior' WHERE id=363;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_noviembre_añoanterior' WHERE id=364;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_diciembre_añoanterior' WHERE id=365;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_total_añoanterior' WHERE id=366;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE heb412_gen_campoplantillahcr SET nombrecampo='anioactual'
        WHERE id=353;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_enero_anioactual' WHERE id=354;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_febrero_anioactual' WHERE id=355;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_marzo_anioactual' WHERE id=356;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_abril_anioactual' WHERE id=357;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_mayo_anioactual' WHERE id=358;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_junio_anioactual' WHERE id=359;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_julio_anioactual' WHERE id=360;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_agosto_anioactual' WHERE id=361;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_septiembre_anioactual' WHERE id=362;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_octubre_anioactual' WHERE id=363;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_noviembre_anioactual' WHERE id=364;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_diciembre_anioactual' WHERE id=365;
      UPDATE heb412_gen_campoplantillahcr SET 
        nombrecampo='aporte_total_anioactual' WHERE id=366;
    SQL
  end

end
