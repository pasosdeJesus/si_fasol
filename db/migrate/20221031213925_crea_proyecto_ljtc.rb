class CreaProyectoLjtc < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO public.cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, responsable_id, fechacreacion, fechadeshabilitacion, created_at, updated_at, compromisos, monto, sectorapc_id, fechaformulacion, fechaaprobacion, fechaliquidacion, estado, dificultad, tipomoneda_id, saldoaejecutarp, centrocosto, tasaej, montoej, aportepropioej, aporteotrosej, presupuestototalej, titulo, poromision) VALUES (11, 'La Justicia tiene Corazón', NULL, '2022-09-01', '2025-08-31', NULL, NULL, NULL, '2022-09-22 14:11:06.475054', '2022-09-30 15:13:40.079267', NULL, 1.0, 17, '2022-06-15', NULL, NULL, 'J', 'M', 2, NULL, '', 4200, 560470, 120000, 0, 680470, 'Visibilización e incidencia de las afectaciones a la independencia judicial por violencias contra los servidores judiciales en Colombia. ', NULL);

      INSERT INTO public.cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (10, 11);

      INSERT INTO public.cor1440_gen_informeauditoria (id, proyectofinanciero_id, detalle, fecha, devoluciones, seguimiento, created_at, updated_at) VALUES (11, 11, 'Primer informe semestral', '2023-03-24', false, '', '2022-09-22 14:35:11.743974', '2022-09-30 15:54:34.469961');
      INSERT INTO public.cor1440_gen_informeauditoria (id, proyectofinanciero_id, detalle, fecha, devoluciones, seguimiento, created_at, updated_at) VALUES (12, 11, 'Segundo informe semestral ', '2023-08-15', false, '', '2022-09-30 15:54:34.471207', '2022-09-30 15:54:34.471207');
      INSERT INTO public.cor1440_gen_informeauditoria (id, proyectofinanciero_id, detalle, fecha, devoluciones, seguimiento, created_at, updated_at) VALUES (13, 11, 'Tercer informe semestral ', '2024-03-22', false, '', '2022-09-30 15:54:34.472312', '2022-09-30 15:54:34.472312');

      INSERT INTO public.cor1440_gen_informenarrativo (id, proyectofinanciero_id, detalle, fecha, devoluciones, seguimiento, created_at, updated_at) VALUES (11, 11, 'Primer informe trimestral de monitoreo ', '2022-12-07', false, '', '2022-09-22 14:35:11.746155', '2022-09-30 15:54:34.473254');

      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (30, 11, 'OG.', 'Investigar, analizar y producir información sistemática para el fortalecimiento de la justicia, la prevención de riesgos. el reconocimiento y la denuncia de las graves afectaciones a los servidores judiciales y sus familias víctimas de la violencia.   ');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (31, 11, 'OE1-CDoc.', 'Establecer un centro de documentación que registre, analice y produzca información acerca de la violencia político social contra los servidores judiciales.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (32, 11, 'OE2-AI.', 'Promover la recuperación y visibilización de la población vinculada (víctimas y aliados territoriales) por medio de espacios de atención integral, formación y proyección social, los cuales contribuyan a la incidencia acerca de la realidad de la violencia contra la justicia en Colombia. ');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (33, 11, 'OE3-GR.', 'Consolidar un área de gestión de recursos para la consecución de aportes propios y la creación de un banco de proyectos, ampliando las posibilidades de cooperación nacional e internacional.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (34, 11, 'OE4-Com.', 'Implementar una estrategia de comunicaciones que contribuya al posicionamiento de Fasol como una organización referente en temas de afectaciones a la justicia y defensa de los derechos humanos. ');

      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (31, 11, 31, '1SInfo.', 'Fasol consolida un sistema para la gestión de la información institucional y la publicación periódica de afectaciones a la independencia del ejercicio judicial.');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (32, 11, 31, '2ORP.', 'Fasol analiza las afectaciones territoriales a la justicia por medio de la implementación de observatorios regionales de prevención. ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (33, 11, 31, '3Inc.', 'Fasol aumenta su capacidad de incidencia  posicionándose como una organización referente en temas de afectaciones a la justicia.');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (34, 11, 32, '1REmo.', 'La población vinculada supera los impactos y daños generados por los hechos violentos y/o mitiga las situaciones de riesgo.');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (35, 11, 32, '2Form.', 'La población cuenta con herramientas de formación para la incidencia y proyección social.  ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (36, 11, 32, '3RedT.', ' La población vinculada constituye redes  territoriales para el cumplimiento de los objetivos institucionales. ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (37, 11, 33, '1AProp.', 'FASOL aporta el 18% del presupuesto total, equivalente a $504.000.000 COP.   ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (38, 11, 34, '1Posic.', 'Fasol cuenta con canales de información institucional que permiten la visibilización de los resultados programáticos, incidencia nacional e internacional y el posicionamiento institucional como organización referente en temas de justicia. ');

      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (9, 11, NULL, 'I1aBdatos', 'Cuenta con un sistema que consolida las cinco bases de datos, organiza, gestiona y produce de manera metódica información institucional.', NULL, 31);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (10, 11, NULL, 'I1bORP', 'Fasol consolida cinco Observatorios Regionales que producen reportes trimestrales e informes anuales de las afectaciones a la justicia. Total: 20 reportes y Cinco informes por año.    ', NULL, 31);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (11, 11, NULL, 'I1aParti', 'Ciento noventa (190) destinatarios (as) y aliados (as) participan en las actividades promovidas por Fasol, consolidando redes territoriales que contribuyen al cumplimiento de los objetivos institucionales.   ', NULL, 32);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (12, 11, NULL, 'I1aDona', ' Fasol sostendrá los donantes locales y aumentará 504 donantes para estabilizar su situación financiera.', NULL, 33);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (13, 11, NULL, 'I1aRed', 'Fasol implementará una estrategia de comunicación interna y externa que diseña y publica los productos institucionales incrementando en un 70% las reacciones de los seguidores en las redes sociales corporativas. ', NULL, 34);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (14, 11, NULL, 'I1bApp', 'Mil (1000) servidores judiciales han descargado e interactuado con la aplicación movió Fasol Te Cuida y se incrementan los reportes de afectaciones a nivel nacional anualmente. ', NULL, 34);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (15, 11, 31, 'I1aAño1', '2 bases de datos ', NULL, NULL);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (16, 11, 32, 'I1bAño1', '2 observatorios', NULL, NULL);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (17, 11, 36, 'I1Año1', '102 participantes', NULL, NULL);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (18, 11, 37, 'I1Año1', '171 afiliaciones', NULL, NULL);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (19, 11, 38, 'I1aAño1', ' X reacciones (que incrementen 24% la línea base)', NULL, NULL);
      INSERT INTO public.cor1440_gen_indicadorpf (id, proyectofinanciero_id, resultadopf_id, numero, indicador, tipoindicador_id, objetivopf_id) VALUES (20, 11, 38, 'I1bAño1', '300 interacciones con la APP', NULL, NULL);

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (31, 11, 'A1Base', 'Se consolida una base de datos', 'Para ser incluida en plataforma SISFASOL', 31, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (32, 11, 'A2ORP', 'Se consolida un observatorio', '', 32, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (33, 11, 'A1Psi', 'Atención psicología', '', 34, NULL, NULL, NULL); 
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (34, 11, 'A2For', 'Encuentro formación', '', 35, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (35, 11, 'A3RedT', 'Consolidación red apoyo', '', 36, NULL, NULL, NULL);

      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (36, 11, 'A1Aportes', 'Reporte mensual de afiliaciones y nuevo aporte propio', 'En el reporte de actividad se pondrá el listado de los nuevos beneficiarios y aporte propio mensual.', 37, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (37, 11, 'A1', 'Reporte mensual de reacciones', 'Número de reacciones en el mes y nuevos seguidores en cada red social (revisión de redacción en las cuatro redes). ', 38, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (38, 11, 'A2', 'Reporte trimestral de usuarios que descargaron y llenaron el formulario de la App.', 'El reporte de actividad tendrá el listado de los beneficiarios que descargaron y llenaron formulario', 38, NULL, NULL, NULL);

      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (11, 11, 10, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:08:16.086235', '2022-10-21 04:13:59.222874', 1, 'cuenta(Actividades_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (12, 11, 11, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:10:45.122069', '2022-10-21 04:14:14.617525', 1, 'cuenta(Actividades_contribuyentes)');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (13, 11, 12, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:12:15.091184', '2022-10-21 04:14:33.013206', 1, 'cuenta(aplana(mapeaproy(Actividades_contribuyentes, Asistentes)))');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (14, 11, 13, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:15:53.085769', '2022-10-21 04:15:53.085769', 3, 'cuenta(aplana(mapeaproy(Actividades_contribuyentes, Asistentes)))');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (15, 11, 14, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:16:51.205364', '2022-10-21 04:16:51.205364', 1, '');
      INSERT INTO public.cor1440_gen_mindicadorpf (id, proyectofinanciero_id, indicadorpf_id, formulacion, frecuenciaanual, descd1, descd2, descd3, meta, created_at, updated_at, medircon, funcionresultado) VALUES (16, 11, 15, NULL, '0,33', NULL, NULL, NULL, NULL, '2022-10-21 04:18:15.576393', '2022-10-21 04:18:15.576393', 1, '');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_mindicadorpf
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_actividadpf 
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_indicadorpf
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_resultadopf
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_objetivopf
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_informenarrativo
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_informeauditoria
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_financiador_proyectofinanciero 
        WHERE proyectofinanciero_id=11;
      DELETE FROM public.cor1440_gen_proyectofinanciero 
        WHERE id=11;
    SQL
  end
end
