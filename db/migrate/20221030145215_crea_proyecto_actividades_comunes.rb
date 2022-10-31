class CreaProyectoActividadesComunes < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO public.cor1440_gen_financiador (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'APORTE PROPIOS FASOL', 'Donaciones individuales de servidores judiciales a nivel nacional', '2022-09-01', NULL, '2022-09-22 13:24:57.677439', '2022-09-30 14:57:11.595225');

      INSERT INTO public.cor1440_gen_proyectofinanciero (id, nombre, observaciones, fechainicio, fechacierre, responsable_id, fechacreacion, fechadeshabilitacion, created_at, updated_at, compromisos, monto, sectorapc_id, fechaformulacion, fechaaprobacion, fechaliquidacion, estado, dificultad, tipomoneda_id, saldoaejecutarp, centrocosto, tasaej, montoej, aportepropioej, aporteotrosej, presupuestototalej, titulo, poromision) VALUES (10, 'Actividades Comunes', NULL, '2022-09-01', NULL, NULL, NULL, NULL, '2022-09-21 23:28:22.251528', '2022-09-22 13:47:24.322302', NULL, 1.0, NULL, '2022-06-15', NULL, NULL, 'E', 'N', NULL, NULL, '', 1, 0, 0, 0, 0, 'Actividades Comunes', NULL);

      INSERT INTO public.cor1440_gen_financiador_proyectofinanciero (financiador_id, proyectofinanciero_id) VALUES (10, 101);
      
      
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (1, 10, 'VISIÓN.', 'FASOL avanza en estrategias de análisis y producción de conocimiento acerca de las problemáticas y afectaciones causadas por la violencia contra el sector judicial; convirtiéndose en un referente de estos temas dentro de la red de organizaciones de derechos humanos para generar propuestas de cambios estructurales a estas realidades. Contaremos con financiación multidonante, con alianzas institucionales consolidadas y con mayor capacidad financiera de auto sostenimiento.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (2, 10, 'MISIÓN ', 'La Corporación Fondo de Solidaridad con los Jueces Colombianos -Fasol- se sustenta en el principio democrático de la independencia judicial y en el valor de la solidaridad con el fin de brindar estrategias de prevención y atención integral a los funcionarios y empleados de la Rama Judicial y Fiscalía que, por su condición de operadores de justicia y ser garantes de los derechos de la población en los territorios, afrontan graves violaciones a los Derechos Humanos; dicha atención es extensible a sus familiares como víctimas indirectas de estas acciones.');
      INSERT INTO public.cor1440_gen_objetivopf (id, proyectofinanciero_id, numero, objetivo) VALUES (3, 10, 'F.', 'Fasol y su línea de atención integral se define como la articulación de servicios para la superación de los daños y afectaciones en las víctimas pertenecientes al sector justicia y sus familias que buscan mitigar, superar y prevenir los daños e impactos a la integridad psicológica, jurídica, moral, familiar, social y económica; estos servicios se brindan a nivel individual, familiar y colectivo, encaminados a la mitigación del dolor emocional, superación de las afectaciones psicosociales relacionadas con los hechos violentos y aportar en la reconstrucción del tejido social.');
      
      
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (1, 10, 3, 'PSI', 'Atención Psicosocial');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (2, 10, 3, 'JUR', 'Atención jurídica	
      ');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (3, 10, 3, 'PROC', 'Promoción y formación para su participación en procesos organizativos');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (109, 10, 3, 'ADM', 'Labor administrativa');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (110, 10, 3, 'GES', 'Gestión');
      INSERT INTO public.cor1440_gen_resultadopf (id, proyectofinanciero_id, objetivopf_id, numero, resultado) VALUES (111, 10, 3, 'COM', 'Comunicaciones');
      
      
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (1, 10, 'AT', 'Atención Psicosocial', '', 1, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (2, 10, 'INC', 'Incidencia', '', 2, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (3, 10, 'TAL', 'Talleres de formación', '', 3, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (112, 10, 'RECJUR', 'Reclamaciones jurídicas', '', 2, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (113, 10, 'VIGADM', 'Vigilancia administrativa', '', 2, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (114, 10, 'ACCHUM', 'Acción Humanitaria', '', 2, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (116, 10, 'AUXEDU', 'Auxilio Educativo', '', 109, NULL, NULL, NULL);
      INSERT INTO public.cor1440_gen_actividadpf (id, proyectofinanciero_id, nombrecorto, titulo, descripcion, resultadopf_id, actividadtipo_id, formulario_id, heredade_id) VALUES (115, 10, 'AUXEME', 'Auxilio Emegencia', '', 109, NULL, NULL, NULL);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_actividadpf 
        WHERE proyectofinanciero_id=10;
      DELETE FROM public.cor1440_gen_resultadopf
        WHERE proyectofinanciero_id=10;
      DELETE FROM public.cor1440_gen_objetivopf
        WHERE proyectofinanciero_id=10;
      DELETE FROM public.cor1440_gen_financiador_proyectofinanciero 
        WHERE proyectofinanciero_id=10;
      DELETE FROM public.cor1440_gen_proyectofinanciero 
        WHERE id=10;
      DELETE FROM public.cor1440_gen_financiador 
        WHERE id=10;
    SQL
  end
end
