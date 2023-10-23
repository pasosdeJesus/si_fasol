class PlantillaComprobanteDonanciones < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO heb412_gen_plantillahcr (id, ruta, fuente, licencia, vista, nombremenu)
        VALUES (15, 'plantillas/Comprobante_Donacion.ods', '', '', 'Persona', 'Comprobante de Donación');

      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (351, 15, 'nombres_y_apellidos', 'E', 6);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (352, 15, 'numerodocumento', 'E', 7);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (353, 15, 'anioactual', 'F', 10);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (354, 15, 'aporte_enero_anioactual', 'F', 13);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (355, 15, 'aporte_febrero_anioactual', 'F', 14);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (356, 15, 'aporte_marzo_anioactual', 'F', 15);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (357, 15, 'aporte_abril_anioactual', 'F', 16);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (358, 15, 'aporte_mayo_anioactual', 'F', 17);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (359, 15, 'aporte_junio_anioactual', 'F', 18);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (360, 15, 'aporte_julio_anioactual', 'F', 19);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (361, 15, 'aporte_agosto_anioactual', 'F', 20);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (362, 15, 'aporte_septiembre_anioactual', 'F', 21);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (363, 15, 'aporte_octubre_anioactual', 'F', 22);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (364, 15, 'aporte_noviembre_anioactual', 'F', 23);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (365, 15, 'aporte_diciembre_anioactual', 'F', 24);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (366, 15, 'aporte_total_anioactual', 'F', 25);
      INSERT INTO heb412_gen_campoplantillahcr (id, plantillahcr_id, nombrecampo, columna, fila)
        VALUES (367, 15, 'fechaactual', 'F', 28);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM heb412_gen_campoplantillahcr WHERE id>='350' AND id<='367';
      DELETE FROM heb412_gen_plantillahcr WHERE id='15';
    SQL
  end
end
