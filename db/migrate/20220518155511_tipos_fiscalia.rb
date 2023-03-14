# frozen_string_literal: true

class TiposFiscalia < ActiveRecord::Migration[7.0]
  def up
    execute(<<-SQL)
      DELETE FROM public.sip_orgsocial WHERE id=312;#{" "}
      DELETE FROM public.sip_grupoper WHERE id=312;

      UPDATE public.sip_grupoper SET nombre='Dirección Nacional CTI' WHERE id=311;

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (312, 'Centro Atención Integral Víctimas de Abuso Sexual. CAIVAS', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (312, 312, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (313, 'Casa de Justicia', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (313, 313, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (314, 'Centro de Atención a Víctimas. CAV', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (314, 314, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (315, 'Centro de Atención a Víctimas de Violencia Intrafamiliar. CAVIF', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (315, 315, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (316, 'Dirección de Articulación de Fiscalías Nacionales Especializadas', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (316, 316, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (317, 'Dirección Nacional de Apoyo a la Gestión', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (317, 317, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (318, 'Dirección Nacional de Seccionales y Seguridad Ciudadana', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (318, 318, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (319, 'Estructura de Apoyo. EDA', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (319, 319, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (320, 'Fiscalía Especializada', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (320, 320, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (321, 'Fiscalía Delegada ante los Jueces Penales del Circuito', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (321, 321, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (322, 'Fiscalía Delegada ante los Jueces Penales Municipales', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (322, 322, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (323, 'Fiscalía Delegada Jueces Promiscuos Municipales', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (323, 323, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (324, 'Fiscalía Infancia y Adolescencia', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (324, 324, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (325, 'Fiscalía Local', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (325, 325, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (326, 'Sala de Atención al Usuario. SAU', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (326, 326, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (327, 'Delegada ante Tribunal', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (327, 327, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (328, 'Unidad de Reacción Inmediata. URI', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (328, 328, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);

      INSERT INTO public.sip_grupoper (id, nombre, anotaciones, created_at, updated_at) VALUES (329, 'Unidad de Responsabilidad Penal para Adolescentes. URPA', '', '2022-05-18', '2022-05-18');
      INSERT INTO public.sip_orgsocial (id, grupoper_id, telefono, fax, direccion, pais_id, web, created_at, updated_at, fechadeshabilitacion, tipoorg_id, subde_id) VALUES (329, 329, '', '', '', 170, '', '2022-05-18', '2022-05-18', NULL, 3, 31);
    SQL
  end

  def down
    execute(<<-SQL)
      DELETE FROM public.sip_orgsocial WHERE id>='312' AND id<='329';
    SQL
  end
end
