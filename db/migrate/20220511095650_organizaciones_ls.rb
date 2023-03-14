# frozen_string_literal: true

class OrganizacionesLs < ActiveRecord::Migration[7.0]
  def up
    execute(<<-SQL)
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (1, 'Estado Colombiano', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (1, 1, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, NULL);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (30, 'Organos Judiciales', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (30, 30, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 1);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (31, 'Fiscalia General de la Nación', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (31, 31, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (311, 'Cuerpo Técnico de Investigación. CTI', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (311, 311, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 31);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (312, 'Instituo Nacional de Medicina Legal y Ciencias Forenses', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (312, 312, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 31);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (32, 'Tribunales', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (32, 32, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (33, 'Jueces', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (33, 33, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (34, 'Corte Suprema de Justicia', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (34, 34, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (35, 'Consejo de Estado', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (35, 35, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (36, 'Corte Constitucional', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (36, 36, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (37, 'Consejo Superior de la Judicatura', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (37, 37, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 30);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (40, 'Ministerio Público', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (40, 40, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 1);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (41, 'Procuraduría General de la Nación', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (41, 41, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 40);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (42, 'Personería Municipal', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (42, 42, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 40);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (43, 'Defensoría del Pueblo', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (43, 43, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 40);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (50, 'Organos de Control', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (50, 50, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 1);
      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (51, 'Contraloría General de la Nación', '', '2022-05-11', '2022-05-11');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (51, 51, '', '', '', 170, '', '2022-05-11', '2022-05-11', NULL, 3, 50);

      SELECT setval('public.sip_grupoper_id_seq', 1000);
      SELECT setval('public.sip_orgsocial_id_seq', 1000);
    SQL
  end

  def down
    execute(<<-SQL)
      DELETE FROM public.sip_orgsocial WHERE id IN (311, 312);
      DELETE FROM public.sip_grupoper WHERE id IN (311, 312);
      DELETE FROM public.sip_orgsocial WHERE id IN (31, 32, 33, 34, 35, 36, 37,
        41, 42, 43, 51
      );
      DELETE FROM public.sip_grupoper WHERE id IN (31, 32, 33, 34, 35, 36, 37,
        41, 42, 43, 51
      );
      DELETE FROM public.sip_orgsocial WHERE id IN (30, 40, 50);
      DELETE FROM public.sip_grupoper WHERE id IN (30, 40, 50);
      DELETE FROM public.sip_orgsocial WHERE id IN (1);
      DELETE FROM public.sip_grupoper WHERE id IN (1);
    SQL
  end
end
