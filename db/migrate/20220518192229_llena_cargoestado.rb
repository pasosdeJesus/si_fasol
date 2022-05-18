class LlenaCargoestado < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (1, 'Sin Información', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (2, 'Almacenista', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (3, 'Asesor(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (4, 'Asistente', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (5, 'Asistente Administrativo', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (6, 'Asistente de Fiscal', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (7, 'Asistente de Investigador Criminalístico', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (8, 'Asistente Judicial', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (9, 'Asistente Social', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (10, 'Citador(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (11, 'Conductor(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (12, 'Coordinador(a) de Unidad o Área', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (13, 'Escolta', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (14, 'Escribiente', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (15, 'Ex-Fiscal', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (16, 'Fiscal', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (17, 'Fotografo(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (18, 'Investigador(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (19, 'Juez', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (20, 'Magistrado Auxiliar', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (21, 'Magistrado Tribunal', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (22, 'Medico Legista', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (23, 'Notificador(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (24, 'Odontologo(a) Forense', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (25, 'Oficial Mayor Juzgado', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (26, 'Perito', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (27, 'Personero(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (28, 'Presidente Tribunal Superior', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (29, 'Procurador Provincia', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (30, 'Profesional en Gestión', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (31, 'Profesional Universitario', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (32, 'Secretario(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (33, 'Servidor(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (34, 'Subdirector Cuerpo Técnico Policia Judicial', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (35, 'Sustanciador(a)', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (36, 'Técnico(a) Administrativo', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (37, 'Técnico(a) Criminalistico', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (38, 'Técnico(a) en Explosivos', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (39, 'Técnico(a) Forense', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (40, 'Técnico(a) Investigador', '2022-05-18', '2022-05-18', '2022-05-18');
      INSERT INTO public.cargoestado (id, nombre, fechacreacion, created_at, updated_at) VALUES (41, 'Técnico(a) Judicial', '2022-05-18', '2022-05-18', '2022-05-18');
      SELECT setval('public.cargoestado_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.cargoestado WHERE id>='1' AND id<='41';
    SQL
  end
end
