class AgregaOpcionesCaracterizacion < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        1, 'Atención Psicosocial', 33, '2022-10-31', '2022-10-31', '2022-10-31'
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        2, 'Incidencia', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        3, 'Talleres de formación', 34, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA2For
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        4, 'Reclamaciones Jurídicas', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        5, 'Vigilancia administrativa', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        6, 'Acción Humanitaria', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        7, 'Auxilio Educativo', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
      INSERT INTO cor1440_gen_opcioncaracterizacion 
      (id, nombre, actividadpf_id, fechacreacion, created_at, updated_at) VALUES (
        8, 'Auxilio Emergencia', 35, '2022-10-31', '2022-10-31', '2022-10-31' -- PLJTC  ActividadMLA3RedT
      );
    SQL
  end

  def down
    Cor1440Gen::Opcioncaracterizacion.where('id >= 1').where('id <= 8').
      delete_all
  end
end
