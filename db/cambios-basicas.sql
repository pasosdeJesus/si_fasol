

INSERT INTO heb412_gen_plantillahcm 
  (id, ruta, fuente, licencia, vista, nombremenu, filainicial) 
  VALUES
  (1, 'plantillas/ReporteTabla.ods', 
   'Pasos de Jesús', 'Dominio Público', 'Caso', 
  'Listado genérico de casos', '6');

INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'caso_id', 'A');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'fecha', 'B');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'memo', 'C');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'ubicaciones', 'D');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'victimas', 'E');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'presponsables', 'F');
INSERT INTO heb412_gen_campoplantillahcm 
  (plantillahcm_id, nombrecampo, columna) 
  VALUES (1, 'tipificacion', 'G');




DELETE FROM public.sip_tipoorg WHERE id = 1;


INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (1, 'Estado Colombiano', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (30, 'Organos Judiciales', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (31, 'Fiscalia General de la Nación', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (311, 'Cuerpo Técnico de Investigación. CTI', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (312, 'Instituo Nacional de Medicina Legal y Ciencias Forenses', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (32, 'Tribunales', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (33, 'Jueces', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (34, 'Corte Suprema de Justicia', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (35, 'Consejo de Estado', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (36, 'Corte Constitucional', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (37, 'Consejo Superior de la Judicatura', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (40, 'Ministerio Público', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (41, 'Procuraduría General de la Nación', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (42, 'Personería Municipal', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (43, 'Defensoría del Pueblo', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (50, 'Organos de Control', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');
INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (51, 'Contraloría General de la Nación', '', '2022-05-11 00:00:00', '2022-05-11 00:00:00');


SELECT pg_catalog.setval('public.sip_grupoper_id_seq', 1000, true);


INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (1, 1, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, NULL);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (30, 30, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 1);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (31, 31, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (311, 311, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 31);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (312, 312, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 31);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (32, 32, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (33, 33, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (34, 34, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (35, 35, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (36, 36, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (37, 37, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 30);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (40, 40, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 1);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (41, 41, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 40);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (42, 42, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 40);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (43, 43, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 40);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (50, 50, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 1);
INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (51, 51, '', '', '', 170, '', '2022-05-11 00:00:00', '2022-05-11 00:00:00', NULL, 3, 50);


SELECT pg_catalog.setval('public.sip_orgsocial_id_seq', 1000, true);

