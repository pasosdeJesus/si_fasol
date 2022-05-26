class AgregaCategoriaAt < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1005, 'MUERTE POR ACCIDENTE DE TRÁNSITO', 100, --NV
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1025, 'ACCIDENTE DE TRÁNSITO', 100, --NV
        '2022-05-23', '2022-05-23', '2022-05-23');

      DELETE FROM sivel2_gen_region  WHERE id IN (6,7,8,9,10,11);
      INSERT INTO sivel2_gen_region (id, nombre, 
        fechacreacion, created_at, updated_at)
        VALUES (23, 'CUNDINAMARCA', '2022-05-23', '2022-05-23', '2022-05-23');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_region WHERE id=23;
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'ANTIOQUIA CHOCO SANT', '2001-01-01', '2022-05-23', '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'LLANOS', '2001-01-01', '2022-05-23', '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'CENTRO', '2001-01-01', NULL, '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'SUR OCCIDENTE', '2001-01-01', '2022-05-23', '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'EJE CAFETERO Y TOLIMA GRANDE', '2001-01-01', '2022-05-23', '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      INSERT INTO public.sivel2_gen_region (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'EXTERIOR', '2001-01-01', '2022-05-23', '2001-01-01 00:00:00', '2001-01-01 00:00:00', NULL);
      DELETE FROM sivel2_gen_categoria 
        WHERE id IN (1005, 1025);
    SQL
  end
end
