#!/usr/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

# Importa datos de un CSV

d = Date.today.day

require "csv"

if ARGV.length != 1
  STDERR.puts "Primer argumento debe ser CSV por importar"
  exit 1
end

# Cambia presunto responsable SIN INFORMACIÓN a SIN PRESUNTO RESPONSABLE
# o si no lo hay lo crea
def sin_presponsable(rpr)
  if rpr.count == 0
    rpr << {
      presponsable_id: 50,
    }
  else
    rpr.each do |r|
      if r[:presponsable_id] == 35
        r[:presponsable_id] = 50
      end
    end
  end
end

cargo_entidad = {
  "1 PISO PALACIO" => [33, 31],
  "106 DDHH" => [33, 31],
  "112 SECCIONAL" => [33, 31],
  "117 LOCAL" => [33, 325],
  "139 FISCALIA SECCIONAL" => [33, 31],
  "156 ESPECIALIZADA" => [33, 31],
  "188 LOCAL" => [33, 325],
  "2 PISO PALACIO" => [33, 31],
  "3 PISO PALACIO " => [33, 31],
  "32 SECCIONAL" => [33, 31],
  "ABOGADO ASESOR" => [3, 1],
  "ADMON PUBLICA MEDELLIN" => [33, 1],
  "AGENTE DE PROTECCION " => [33, 1],
  "ALMACENISTA" => [2, 1],
  "ARAUCA" => [33, 31],
  "ASESOR JURIDICO TRIBUNALES" => [3, 30],
  "ASESOR UNIDAD FISCAL" => [3, 31],
  "ASIGNACIONES" => [33, 1],
  "ASISTENTE" => [4, 1],
  "ASISTENTE ADMINISTRATIVO" => [5, 1],
  "ASISTENTE DE FISCAL" => [6, 31],
  "ASISTENTE DE FISCAL 1" => [6, 31],
  "ASISTENTE DE FISCAL 2" => [6, 31],
  "ASISTENTE DE INVESTIGADOR CRIMINALISTICO" => [7, 31],
  "ASISTENTE FICAL " => [6, 31],
  "ASISTENTE FISCAL" => [6, 31],
  "ASISTENTE FISCAL " => [6, 31],
  "ASISTENTE FISCAL 1" => [6, 31],
  "ASISTENTE FISCAL 81" => [6, 31],
  "ASISTENTE JUDICIAL" => [8, 30],
  "ASISTENTE SOCIAL" => [9, 1],
  "ASITENTE SOCIAL 1" => [9, 1],
  "AUXILIAR " => [4, 1],
  "AUXILIAR ADMINISTRATIVO" => [5, 1],
  "AUXILIAR JUDICIAL" => [8, 1],
  "AUXILIAR JUDICIAL 2" => [8, 1],
  "CESPA" => [33, 31],
  "CITADOR 3" => [10, 1],
  "CITADOR GRADO 3" => [10, 1],
  "CITADOR JUZGADO" => [10, 1],
  "CITADORA" => [10, 1],
  "CITADORA 3" => [10, 1],
  "CONDUCTOR" => [11, 1],
  "COORDINADOR ACTOS URGENTES DE LA URI" => [12, 31],
  "COORDINADOR AREA UNIDAD DDHH" => [12, 31],
  "COORDINADOR CTI" => [12, 311],
  "COORDINADOR DE FISCALIAS ESPECIALIZADA" => [12, 320],
  "COORDINADOR FISCALIA UNIDAD FUSAGASUGA FISCAL 2 SECCIONAL" => [12, 31],
  "COORDINADOR POLICIA JUDICIAL" => [12, 31],
  "COORDINADOR PROCURADORES JUDICIALES" => [12, 31],
  "COORDINADOR SUBUNIDAD EXHUMACIONES UNIDAD JUSTICIA Y PAZ" => [12, 31],
  "COORDINADOR UNIDAD BACRIM" => [12, 31],
  "COORDINADOR UNIDAD FISCALIA DELEGADA" => [12, 31],
  "COORDINADOR UNIDAD INVESTIGACION CTI" => [12, 311],
  "COORDINADORA BIENESTAR" => [12, 1],
  "CRIMINALISTICA" => [18, 31],
  "CTI" => [33, 311],
  "DDHH" => [33, 31],
  "DECOC" => [33, 31],
  "DERECHOS HUMANOS" => [33, 31],
  "DIRECTOR REGIONAL" => [33, 31],
  "DIRECTOR SECCIONAL" => [33, 31],
  "DIRECTOR UNIDAD DDHH" => [33, 31],
  "EDA" => [33, 319],
  "EMPLEADA JUZGADO PENAL" => [33, 30],
  "EMPLEADO ASONAL" => [33, 30],
  "EMPLEADO CAFETERIA PALACIO" => [33, 30],
  "EMPLEADO DEL CENTRO DE EJECUCION DE PENAS" => [33, 30],
  "EMPLEADO JURISPRUDENCIA" => [33, 30],
  "EMPLEADO JUZGADO" => [33, 30],
  "EMPLEADO JUZGADO DE MENORES" => [33, 30],
  "EMPLEADO RAMA JUDICIAL" => [33, 30],
  "ESCOLTA CTI" => [13, 311],
  "ESCRIBIENTE" => [14, 30],
  "Escribiente" => [14, 30],
  "ESCRIBIENTE MUNICIPAL CENTRO DE SERVICIOS JUDICIALES" => [14, 30],
  "EX FISCAL" => [15, 31],
  "EX-FISCAL" => [15, 31],
  "FIS ENVIGADO" => [16, 31],
  "FISCAL" => [16, 31],
  "FISCAL " => [16, 31],
  "FISCAL 1 LOCAL EDA" => [16, 319],
  "FISCAL 122 MEDELLIN" => [16, 31],
  "FISCAL 18 SECCIONAL " => [16, 31],
  "FISCAL 20 SECCIONAL " => [16, 31],
  "FISCAL 262" => [16, 31],
  "FISCAL 36 UNIDAD ANTITERRORISMO" => [16, 31],
  "FISCAL 4" => [16, 31],
  "FISCAL 56 DELEGADA ANTE EL CTI" => [16, 31],
  "FISCAL 62 SECCIONAL" => [16, 31],
  "FISCAL 65" => [16, 31],
  "FISCAL 71" => [16, 31],
  "FISCAL 72" => [16, 31],
  "FISCAL 96 ESPECIALIZADO CONTRA DELINCUENCIA ORGANIZADA" => [16, 320],
  "FISCAL ACTIVO" => [16, 31],
  "FISCAL ANTE TRIBUANL " => [16, 31],
  "FISCAL ANTITERRORISMO" => [16, 31],
  "FISCAL CONTRA DELITOS FINANCIEROS" => [16, 31],
  "FISCAL COORDINADOR UNAIM" => [16, 31],
  "FISCAL DE ASUNTOS URGENTES" => [16, 31],
  "FISCAL DE CIRCUITO " => [16, 31],
  "FISCAL DE VIOLENCIA SEXUAL" => [16, 31],
  "FISCAL DELEGADA ANTE JUECES MUNICIPALES DEL MUNICIPIO DE SEVILLA" => [16, 31],
  "FISCAL DELEGADA ANTE LOS JUECES PENAL" => [16, 31],
  "FISCAL DELEGADO" => [16, 31],
  "FISCAL DELEGADO " => [16, 31],
  "FISCAL DELEGADO ANTE EL CIRCUITO" => [16, 31],
  "FISCAL DELEGADO ANTE JUECES PENALES" => [16, 31],
  "FISCAL DELEGADO GAULA" => [16, 31],
  "FISCAL DELEGADO SALA PENAL" => [16, 31],
  "FISCAL ENCARGADO" => [16, 31],
  "FISCAL ESPECIALIZADA" => [16, 320],
  "FISCAL ESPECIALIZADO" => [16, 320],
  "FISCAL JEFE UNIDAD NACIONAL DDHH" => [16, 31],
  "FISCAL JUECES" => [16, 31],
  "FISCAL LOCAL" => [16, 325],
  "FISCAL LOCAL " => [16, 325],
  "FISCAL REGIONAL" => [16, 31],
  "FISCAL SECCIONAL" => [16, 31],
  "FISCAL SECCIONAL " => [16, 31],
  "FISCAL SECCIONAL 13" => [16, 31],
  "FISCAL SECCIONAL 2" => [16, 31],
  "FISCAL SECCIONAL 3" => [16, 31],
  "FISCAL SECCIONAL UNIDAD DE ADMON PUBLICA" => [16, 31],
  "FISCAL SEGUNDA DAC SUPREMA" => [16, 31],
  "FISCAL UNAIM" => [16, 31],
  "FISCAL UNIDAD DDHH" => [16, 31],
  "FISCAL UNIDAD DDHH Y DIH" => [16, 31],
  "FISCAL UNIDAD DE VIDA" => [16, 31],
  "FISCAL UNIDAD LOCAL" => [16, 325],
  "FISCAL UNIDAD NACIONAL JUSTICIA Y PAZ" => [16, 31],
  "FISCAL UNIDAD TERRORISMO" => [16, 31],
  "FISCALIA 61 BACRIM" => [33, 31],
  "FISCALIA 73" => [33, 31],
  "FISCALIA 88" => [33, 31],
  "FISCALIAS LOCALES" => [33, 325],
  "FOTOGRAFO" => [17, 1],
  "Funcionaria Fiscalia" => [33, 31],
  "FUNCIONARIO CTI" => [33, 311],
  "FUNCIONARIO JUDICIAL" => [33, 31],
  "INFANCIA Y ADOLESCENCIA" => [33, 31],
  "INGENIERO SISTEMAS" => [33, 1],
  "INVDESTIGADOR CTI" => [18, 311],
  "INVESTIGADOR" => [18, 31],
  "INVESTIGADOR CRIMINALISTICO" => [18, 31],
  "INVESTIGADOR CTI" => [18, 311],
  "INVESTIGADOR CTI - CTI" => [18, 311],
  "INVESTIGADOR CTI GRADO II" => [18, 311],
  "INVESTIGADOR CUERPO TECNICO DE INVESTIGACIÓN - URI" => [18, 311],
  "INVESTIGADOR GRADO II" => [18, 31],
  "INVESTIGADOR II" => [18, 31],
  "INVESTIGADOR JUDICIAL" => [18, 31],
  "INVESTIGADOR UNIDAD DE VIDA" => [18, 31],
  "INVESTIGADORA CTI" => [18, 311],
  "INVESTIGADORES CTI" => [18, 311],
  "JEFE INVESTIGADOR" => [12, 31],
  "JEFE OFICINA INFORMACION CTI" => [12, 31],
  "JEFE POLICIA JUDICIAL" => [12, 31],
  "JEFE SECCION DE INFORMACION Y ANALISIS" => [12, 31],
  "JEFE UNIDAD SECCIONAL CTI" => [12, 311],
  "JUEZ" => [19, 33],
  "JUEZ  " => [19, 33],
  "JUEZ - JUZGADO 2 PENAL DEL CTO" => [19, 33],
  "JUEZ 10 PEJNAL DEL CIRCUITO" => [19, 33],
  "JUEZ 10 PENAL DEL CIRCUITO DE CONOCIMIENTO DE CALI" => [19, 33],
  "JUEZ 11 DEL CIRCUITO DE BOGOTA" => [19, 33],
  "JUEZ 17" => [19, 33],
  "JUEZ 19 PENAL" => [19, 33],
  "JUEZ 2" => [19, 33],
  "JUEZ 2 DE GARANTIAS" => [19, 33],
  "JUEZ 20 PENAL DEL CIRCUITO" => [19, 33],
  "JUEZ 29 DE FAMILIA" => [19, 33],
  "JUEZ 31" => [19, 33],
  "JUEZ 32 ADMINISTRATIVO" => [19, 33],
  "JUEZ 35" => [19, 33],
  "JUEZ 4 CIVIL DEL CIRCUITO DE IBAGUE" => [19, 33],
  "JUEZ 5 CIVIL DEL CIRCUITO DE IBAGUE" => [19, 33],
  "JUEZ CIVIL" => [19, 33],
  "JUEZ COORDINADOR CENTRO DE SERVICIOS JUDICIALES" => [19, 33],
  "JUEZ DE CONOCIMIENTO" => [19, 33],
  "JUEZ DE FAMILIA" => [19, 33],
  "JUEZ DE GARANTIAS" => [19, 33],
  "JUEZ DE MENORES" => [19, 33],
  "JUEZ DE PEQUEÑAS CAUSAS" => [19, 33],
  "JUEZ DE RESTITUCION DE TIERRAS" => [19, 33],
  "JUEZ DE RESTITUCIÓN TERCERO CIVIL DEL CIRCUITO" => [19, 33],
  "JUEZ DISTRITO PENAL ADUANERO" => [19, 33],
  "JUEZ EJECUCION DE PENAS" => [19, 33],
  "JUEZ ENCARGADO" => [19, 33],
  "JUEZ ESPECIALIZADO" => [19, 33],
  "JUEZ GARANTIAS" => [19, 33],
  "JUEZ INSTRUCCION CRIMINAL" => [19, 33],
  "JUEZ LABORAL" => [19, 33],
  "JUEZ MUNICIPAL" => [19, 33],
  "JUEZ ORDEN PUBLICO" => [19, 33],
  "JUEZ PENAL" => [19, 33],
  "JUEZ PENAL DEL CIRCUITO" => [19, 33],
  "JUEZ PROMISCUO DE PUERTO COLOMBIA" => [19, 33],
  "JUEZ PROMISCUO MUNICIPAL" => [19, 33],
  "JUEZ PROMISCUO TERRITORIAL" => [19, 33],
  "JUEZ, JUZGADO 1 PENAL DEL CIRCUITO ESPECIALIZADO" => [19, 33],
  "JUZGADO 2 MUNICIPAL DE MEDELLIN" => [19, 33],
  "JZ TERCERA FILA ASISTENTE SOCIAL" => [19, 33],
  "JZ TERCERO DE FAMILIA" => [19, 33],
  "LOCALES" => [33, 325],
  "MAGISTRADO" => [21, 30],
  "Magistrado" => [21, 30],
  "MAGISTRADO AUXILIAR" => [20, 30],
  "MAGISTRADO ORDEN PUBLICO" => [21, 30],
  "MAGISTRADO SALA PENAL CORTE SUPREMA DE JUSTICIA" => [21, 30],
  "MAGISTRADO SALA PENAL TRIBUNAL SUPERIOR" => [21, 30],
  "MAGISTRADO TRIBUNAL" => [21, 30],
  "MAGISTRADO TRIBUNAL ADMINISTRATIVO" => [21, 30],
  "MAGISTRADO TRIBUNAL CONTENCIOSO" => [21, 30],
  "MAGISTRADO TRIBUNAL SUPERIOR" => [21, 30],
  "MEDICO LEGISTA" => [22, 30],
  "NO REGISTRA" => [33, 1],
  "NO REGISTRA " => [33, 1],
  "NOTIFICADOR" => [23, 30],
  "NOTIFICADOR GRADO 3" => [23, 30],
  "OCAÑA" => [33, 1],
  "ODONTOLOGO FORENSE" => [24, 30],
  "OFICIAL MAYOR" => [25, 30],
  "OFICIAL MAYOR JUZGADO" => [25, 30],
  "OFICIAL MAYOR JUZGADO PROMISCUO DE FAMILIA" => [25, 30],
  "PALACIO NACIONAL" => [33, 1],
  "PAMPLONA" => [33, 1],
  "PATIOS" => [33, 1],
  "PERITO EN AUTOMOTORES" => [26, 30],
  "PERSONERO" => [27, 42],
  "presidente del Tribunal Superior de Valledupar" => [28, 30],
  "PRESIDENTE TRIBUNAL SUPERIOR" => [28, 30],
  "PROCURADOR PROVINCIA" => [29, 30],
  "PROFESIONAL " => [31, 1],
  "PROFESIONAL EN GESTION" => [30, 1],
  "PROFESIONAL EN GESTION 3" => [30, 1],
  "PROFESIONAL GESTION " => [30, 1],
  "PROFESIONAL GESTION 2 " => [30, 1],
  "PROFESIONAL GESTION 3 " => [30, 1],
  "PROFESIONAL UNIVERSITARIO" => [31, 1],
  "SECRETARIA" => [32, 1],
  "SECRETARIA ADMINISTRATIVA " => [32, 1],
  "SECRETARIA ADTIVA " => [32, 1],
  "SECRETARIA CIRCUITO" => [32, 30],
  "secretaria de la Fiscalía Sexta" => [32, 31],
  "SECRETARIO" => [32, 1],
  "SECRETARIO ADMINISTRATIVO JUZGADO" => [32, 1],
  "SECRETARIO AUXILIAR" => [32, 1],
  "SECRETARIO DE JUZGADO" => [32, 30],
  "SECRETARIO ENCARGADO" => [32, 1],
  "SECRETARIO JUDICIAL" => [32, 30],
  "SECRETARIO JUZGADO" => [32, 30],
  "SECRETARIO JUZGADO CIVIL CIRCUITO RIOSUCIO CALDAS" => [32, 30],
  "SECRETARIO JUZGADO MUNICIPAL" => [32, 30],
  "SECRETARIO NOMINADO" => [32, 1],
  "SECRETARIO TRIBUNAL SUPERIOR" => [32, 30],
  "SECRETARIO UNIDAD DE PATRIMONIO" => [32, 31],
  "SECRETARIO UNIDAD FISCALIA" => [32, 31],
  "SERVIDOR CTI" => [33, 311],
  "SERVIDOR FISCALIA" => [33, 31],
  "SERVIDOR JUZGADO PROMISCUO MUNICIPAL" => [33, 30],
  "SUBDIRECTOR CUERPO TECNICO POLICIA JUDICIAL" => [34, 30],
  "SUSTANCIADOR" => [35, 30],
  "SUSTANCIADOR JUZGADO" => [35, 30],
  "SUSTANCIADORA" => [35, 30],
  "TEC FORENCE 2" => [39, 30],
  "TEC INVESTIGADOR" => [40, 31],
  "TEC INVESTIGADOR 1" => [40, 31],
  "TEC INVESTIGADOR 2 " => [40, 31],
  "TEC INVESTIGADOR 4" => [40, 31],
  "TEC INVESTIGADOR 4 " => [40, 31],
  "TEC INVESTIGADRO 4 " => [40, 31],
  "TEC INVESTIGARDOR 2" => [40, 31],
  "TECNICA INVESTIGADORA 1" => [40, 31],
  "TECNICO ADMINISTRATIVO 2" => [36, 1],
  "TECNICO CRIMINALISTICO" => [37, 31],
  "TECNICO EN EXPLOSIVOS" => [38, 31],
  "TECNICO INVESTIGACION II - CTI" => [40, 31],
  "TECNICO INVESTIGADOR" => [40, 31],
  "TECNICO INVESTIGADOR 1" => [40, 31],
  "TECNICO INVESTIGADOR 2" => [40, 31],
  "TECNICO INVESTIGADOR FISCALIA" => [40, 31],
  "TECNICO INVESTIGADOR I - CTI" => [40, 31],
  "TECNICO INVESTIGADOR II" => [40, 31],
  "TECNICO INVESTIGADOR IV" => [40, 31],
  "TECNICO JUDICIAL" => [41, 31],
  "TRIBUNAL FISCAL" => [33, 31],
  "UNIDAD VIDA-PALOQUEMAO" => [33, 31],
  "URI" => [33, 328],
  "VIDA -PALOQUEMAO" => [33, 31],
}

tpresp = {
  "AGUILAS NEGRAS" => 14,
  "AL MANDO DE ALIAS GUACHO" => 14,
  "ALIAS TOTO" => 14,
  "APARENTEMENTE DELINCUENCIA COMUN" => 35,
  "AUTODEFENSAS UNIDAS DE COLOMBIA" => 14,
  "AUTORES DESCONOCIDOS" => 35,
  "BACRIM" => 14,
  "BACRIN" => 14,
  "BANDAS CRIMINALES BACRIM" => 14,
  "CARTEL DEL VALLE" => 14,
  "CLAN DEL GOLFO" => 14,
  "CLAN USUGA" => 14,
  "CONDUCTOR CAMION" => 35,
  "CONVIVIR" => 14,
  "COORDINADOR DE LA URI" => 1,
  "DAS" => 12,
  "DEA" => 24,
  "DELINCUANCIA ORGANIZADA" => 35,
  "DELINCUENCIA" => 35,
  "DELINCUENCIA COMUN" => 35,
  "DELINCUENCIA ORGANIZADA" => 35,
  "DELINCUENCIA ORGANIZADA - BANDAS CRIMINALES ORGANIZADAS EN LA ZONA \"LOS PACHENCAS\"" => 35,
  "DELINCUENCIA ORGANIZADA URABEÑOS" => 35,
  "DIJIN" => 10,
  "DIJIN MON" => 10,
  "DISCIDENCIAS DE LA FARC" => 25,
  "EJERCITO" => 4,
  "ELN" => 25,
  "ELN - GRUPO OLIVER SINISETRRA" => 25,
  "ELN ALIAS EL NENE" => 25,
  "EN INVESTIGACION" => 35,
  "EPL" => 25,
  "ESCOLTA FISCAL GENERAL DE LA NACION" => 35,
  "ESTADO" => 1,
  "ESTADO F2" => 1,
  "EX-AGENTES DE POLICIA" => 35,
  "FARC" => 25,
  "FLIAR DE IMPUTADO" => 35,
  "FUE ENCONTRADO MUERTO EN EL APTO" => 35,
  "FUERZA PUBLICA" => 2,
  "FUERZA PUBLICA - POLICIA" => 7,
  "FUERZAS DEL ESTADO" => 2,
  "Fueza publica" => 2,
  "GOBERNADOR DE CORDOBA ALEJANDRO JOSE LYONS MUSKUS Y PERIODICO EL MERIDIANO DE CORDOBA" => 1,
  "GRUPO ARMADO" => 35,
  "GRUPO ARMADO DEFENSORES DEL PUEBLO" => 35,
  "GRUPO ILEGAL" => 35,
  "GRUPO PARAMILITAR MAS" => 14,
  "GUERRILLA" => 25,
  "GUERRILLA ERP" => 14,
  "HAYADO MUERTO POR ENVENAMIENTO CON CIANURO" => 35,
  "INSTITUCIONALIDAD" => 1,
  "INSURGENCIA" => 25,
  "JAIRO ENRIQUE POLO VIDES" => 35,
  "LOS URABEÑOS" => 14,
  "MIEMBROS CTI" => 13,
  "MILICIANOS DE LA GUERRILLA" => 25,
  "MILICIAS BOLIVARIANAS" => 25,
  "MILICIAS POPULARES" => 25,
  "N/A" => 35,
  "NARCO TRAFICO" => 35,
  "NARCOGRAFICO" => 35,
  "NARCOTRAFICO" => 35,
  "NO SE CONOCE" => 35,
  "NO SE SABE" => 35,
  "OFICINA DE ENVIGADO" => 14,
  "ORGANISMOS ESTATALES" => 1,
  "PARAMILITARES" => 14,
  "PERSECUCION POR EL GOBERNADOR Y MEDIOS DE COMUNICACIÓN" => 1,
  "POLICIA" => 7,
  "POSIBLES COMPAÑEROS CTI" => 13,
  "Providencia y Santa Catalina" => 35,
  "RASTROJOS" => 14,
  "SICARIATO" => 35,
  "SIJIN" => 9,
  "SIJIN Y EJERCITO" => 9,
  "SIN INFORMACION" => 35,
  "TERRORISMO" => 35,
  "VALLE DEL CAUCA" => 35,
  "VARIOS ACTORES ARMADOS" => 35,
  "WILSON DE JESUS MEJIA GUZMAN" => 35,
  "X CASO DE ACTO SEXUAL CON MENOR DE EDAD" => 35,
  "" => 35,
}

treg = {
  "A" => [20, nil],
  "A / C" => [20, 23],
  "ANTIOQUIA" => [20, nil],
  "C" => [23, nil],
  "C / SUR" => [23, 22],
  "CC" => [5, nil],
  "CC / A" => [5, 20],
  "COSTA CARIBE" => [5, nil],
  "CUNDINAMARCA" => [23, nil],
  "NORTE DE SANTANDER" => [21, nil],
  "S" => [21, nil],
  "S / C" => [21, 23],
  "S / CC" => [21, 5],
  "SANTANDER" => [21, nil],
  "SANTANDERES" => [21, nil],
  "SUR" => [22, nil],
}

tcat = {
  ["Muerte", "PP", 39] => [10, ""], # Polo Estatal
  ["Muerte", "AA", 39] => [20, ""],
  ["Muerte", "VPS", 39] => [20, "Cambiando categoría a DH-AA (Revisar porque podría ser PP o IS)"],
  ["Muerte", "IS", 39] => [30, ""],

  ["Muerte", "VPS", 40] => [701, "Cambiando categoría a DIH"], # Insurgente

  ["Muerte", "PP", 35] => [40, ""], # Polo Sin Información
  ["Muerte", "PP", nil] => [40, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Muerte", "VPS", 35] => [40, ""],
  ["Muerte", "VPS", nil] => [40, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Muerte", "VSP", 35] => [40, ""],
  ["Muerte", "VSP", nil] => [40, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Muerte", "IS", 35] => [50, ""],
  ["Muerte", "IS", nil] => [50, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Muerte", "AL", 35] => [1000, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "AL", nil] => [1000, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "AT", 35] => [1005, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "AT", nil] => [1005, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "DN", 35] => [1001, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "DN", nil] => [1001, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "ENF", 35] => [1002, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "ENF", nil] => [1002, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "MN", 35] => [1003, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "MN", nil] => [1003, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "SUI", 35] => [1004, "Cambiando presunto responsable a SIN PRESUNTO RESPONSABLE"],
  ["Muerte", "SUI", nil] => [1004, "Agregando presunto responsable a SIN PRESUNTO RESPONSABLE"],

  ["Tortura", "PP", 39] => [12, ""], # Polo Estatal
  ["Tortura", "VPS", 39] => [22, "Cambiando a DH-AA. Revisar"],
  ["Tortura", "AA", 39] => [22, ""],
  ["Tortura", "IS", 39] => [36, ""],

  ["Tortura", "PP", 35] => [47, ""], # Polo Sin Información
  ["Tortura", "PP", nil] => [47, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Tortura", "VPS", 35] => [47, ""],
  ["Tortura", "VPS", nil] => [47, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Tortura", "IS", 35] => [56, ""],
  ["Tortura", "IS", nil] => [47, "Agregando presunto responsable SIN INFORMACIÓN"],

  [
    "Tortura",
    "VPS",
    39,
  ] => [
    12,
    "No corresponden Polo Estatal y categoría VPS. Cambiando a DH-PP (revisar manualmente, podría ser AA o IS)",
  ],
  ["Tortura", "VPS", 40] => [72, "No corresponden Polo Insurgente y categoría VPS. Cambiando a DIH"],

  ["Atentado", "PP", 39] => [16, ""], # Polo Estatal
  ["Atentado", "VPS", 39] => [16, ""],
  ["Atentado", "VSP", 39] => [16, ""],
  ["Atentado", "AA", 39] => [26, ""],
  ["Atentado", "IS", 39] => [37, ""],

  ["Atentado", "PP", 35] => [46, ""], # Polo Sin Info
  ["Atentado", "PP", nil] => [46, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Atentado", "VPS", 35] => [46, ""],
  ["Atentado", "VPS", nil] => [46, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Atentado", "VSP", 35] => [46, ""],
  ["Atentado", "VSP", nil] => [46, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Atentado", "IS", 35] => [47, ""],
  ["Atentado", "IS", nil] => [47, "Agregando presunto responsable SIN INFORMACIÓN"],

  ["Atentado", "VPS", 40] => [46, ""], # Polo Insurgente
  ["Atentado", "PP", 40] => [46, ""],

  ["Amenaza", "PP", 39] => [15, ""], # Polo Estatal
  ["Amenaza", "VPS", 39] => [15, ""], # Polo Estatal
  ["Amenaza", "AA", 39] => [25, ""],
  ["Amenaza", "IS", 39] => [35, ""],

  ["Amenaza", "PP", 35] => [45, ""], # Polo Sin Info
  ["Amenaza", "PP", nil] => [45, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Amenaza", "VPS", 35] => [45, ""],
  ["Amenaza", "VPS", nil] => [45, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Amenaza", "VSP", 35] => [45, ""],
  ["Amenaza", "VSP", nil] => [45, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Amenaza", "IS", 35] => [55, ""],
  ["Amenaza", "IS", nil] => [55, "Agregando presunto responsable SIN INFORMACIÓN"],

  ["Amenaza", "VPS", 40] => [73, "Cambiando de VPS a DIH"], # Polo Insurgente
  ["Amenaza", "PP", 40] => [73, "Cambiando de DH a DIH"], # Polo Insurgente

  ["Desaparición", "PP", 39] => [11, ""], # Polo Estatal
  ["Desaparición", "VPS", 39] => [11, ""],
  ["Desaparición", "AA", 39] => [21, ""],
  ["Desaparición", "IS", 39] => [302, ""],

  ["Detención", "PP", 39] => [14, ""], # Polo Estatal
  ["Detención", "VPS", 39] => [14, ""],
  ["Detención", "AA", 39] => [24, ""],
  ["Detención", "IS", 39] => [301, ""],

  ["Exilio", "PP", 39] => [1030, ""], # Polo Estatal
  ["Exilio", "VPS", 39] => [1030, ""],
  ["Exilio", "VSP", 39] => [1030, ""],

  ["Exilio", "VPS", 35] => [1040, ""], # Polo Sin Info
  ["Exilio", "VPS", nil] => [1040, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Exilio", "PP", 35] => [1040, ""],
  ["Exilio", "PP", nil] => [1040, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Exilio", "VSP", 35] => [1040, ""], # Polo Sin Info
  ["Exilio", "VSP", nil] => [1040, "Agregando presunto responsable SIN INFORMACIÓN"],

  ["Secuestro", "PP", 39] => [41, ""], # Polo Estatal
  ["Secuestro", "VPS", 39] => [41, ""],
  ["Secuestro", "VSP", 39] => [41, ""],
  ["Secuestro", "PP", 35] => [41, ""], # Polo Sin Info
  ["Secuestro", "PP", nil] => [41, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Secuestro", "VPS", nil] => [41, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Secuestro", "PP", 40] => [41, ""], # Polo Insurgente
  ["Secuestro", "VPS", 40] => [41, ""], # Polo Insurgente

  ["Desplazamiento", "PP", 39] => [1050, ""], # Polo Estatal
  ["Desplazamiento", "VPS", 39] => [1050, ""], # Polo Estatal

  ["Desplazamiento", "PP", 35] => [1060, ""], # Polo Sin Info
  ["Desplazamiento", "PP", nil] => [1060, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Desplazamiento", "IS", 35] => [1060, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Desplazamiento", "IS", nil] => [1060, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Desplazamiento", "VPS", 35] => [1060, ""],
  ["Desplazamiento", "VPS", nil] => [1060, "Agregando presunto responsable SIN INFORMACIÓN"],
  ["Desplazamiento", "VSP", 35] => [1060, ""],
  ["Desplazamiento", "VSP", nil] => [1060, "Agregando presunto responsable SIN INFORMACIÓN"],

  ["Desplazamiento", "VPS", 40] => [1060, ""], # Polo Insurgente

  ["Judicialización", "PP", 39] => [141, ""], # Polo Estatal
  ["Judicialización", "VPS", 39] => [141, ""], # Polo Estatal
  ["Judicialización", "AA", 39] => [241, ""],
  ["Judicialización", "IS", 39] => [341, ""],

  ["Judicialización", "VPS", 39] => [1080, ""], # Polo Sin Info
  ["Judicialización", "AL", 39] => [1080, "Cambiando AL por VPS"],

  ["Otras Afectaciones", "ACOSO LABORAL", 39] => [1070, ""], # Polo Estatal

  ["Otras Afectaciones", "AL", 35] => [1023, "Cambiando PR a SIN PR"], # Polo Sin Presp
  ["Otras Afectaciones", "AL", nil] => [1023, "Agregando SIN PR"], # Polo Sin Presp
  ["Otras Afectaciones", "AT", 35] => [1025, "Cambiando PR a SIN PR"],
  ["Otras Afectaciones", "AT", nil] => [1025, "Agregando SIN PR"],
  ["Otras Afectaciones", "ENF", 35] => [1024, "Cambiando PR a SIN PR"],
  ["Otras Afectaciones", "ENF", nil] => [1024, "Agregando SIN PR"],
  ["Otras Afectaciones", "PEN", 35] => [1020, "Cambiando PR a SIN PR"],
  ["Otras Afectaciones", "PEN", nil] => [1020, "Agregando SIN PR"],
  ["Otras Afectaciones", "CE", 35] => [1021, "Cambiando PR a SIN PR"],
  ["Otras Afectaciones", "CE", nil] => [1021, "Agregando SIN PR"],
}

nimp = ARGV[0]
STDERR.puts "Leyendo casos de #{nimp}"
impcsv = CSV.read(nimp, headers: true)
encimp = impcsv[0].headers
STDERR.puts "Se leyeron #{impcsv.count} registros de #{nimp}"
if !encimp.include?("NO PERSONAS") ||
    !encimp.include?("CEDULA") ||
    !encimp.include?("NOMBRE DEL SERVIDOR") ||
    !encimp.include?("FECHA DE NACIMIENTO") ||
    !encimp.include?("EDAD HECHO") ||
    !encimp.include?("GENERO") ||
    !encimp.include?("CARGO") ||
    !encimp.include?("Muerte") ||
    !encimp.include?("Tortura") ||
    !encimp.include?("Herido") ||
    !encimp.include?("Atentado") ||
    !encimp.include?("Amenaza") ||
    !encimp.include?("Desaparición") ||
    !encimp.include?("Detención") ||
    !encimp.include?("Exilio") ||
    !encimp.include?("Secuestro") ||
    !encimp.include?("Desplazamiento") ||
    !encimp.include?("Judicialización") ||
    !encimp.include?("Otras Afectaciones") ||
    !encimp.include?("FECHA HECHO") ||
    !encimp.include?("LUGAR DE LOS HECHOS") ||
    !encimp.include?("DEPARTAMENTO") ||
    !encimp.include?("PRESUNTOS RESPONSABLES") ||
    !encimp.include?("OBSERVACIONES") ||
    !encimp.include?("FECHA REGISTRO") ||
    !encimp.include?("AYUDA DE FASOL") ||
    !encimp.include?("COMPETENCIA DE FASOL") ||
    !encimp.include?("CARPETAS") ||
    !encimp.include?("REGIONAL") ||
    !encimp.include?("FAMILIAR") ||
    !encimp.include?("CODIGO") ||
    !encimp.include?("MARBETE") ||
    !encimp.include?("OBSERVACION")
  puts "El CSV #{nimp} no tiene los encabezados esperados"
  exit 1
end

nreg = 0
impcsv.each do |r|
  nreg += 1
  pcaso = [] # Problemas en el caso
  menserror = ""
  pa = Msip::ImportaHelper.separa_apellidos_nombres(
    r["NOMBRE DEL SERVIDOR"], menserror
  )
  if menserror != ""
    puts "#{nimp}:#{nreg}: *** #{menserror}"
  end
  rp = { nombres: pa[0], apellidos: pa[1] }
  if r["CEDULA"]
    rp["numerodocumento"] = r["CEDULA"]
    rp["tdocumento_id"] = Msip::Tdocumento.where(sigla: "CC")[0].id
  end
  fechad = nil
  fecha = r["FECHA HECHO"]
  fechanacd = nil
  fechanac = r["FECHA DE NACIMIENTO"]
  edad = r["EDAD HECHO"]
  if fecha
    pf = fecha.split("/")
    if pf.count == 3
      begin
        fechad = Date.strptime(fecha, "%m/%d/%Y")
      rescue Exception
        puts "#{nimp}:#{nreg}: *** Fecha del hecho en formato desconocido "\
          "'#{fecha}'"
        fechad = Date.new(2000, 6, 15)
        pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
      end
    else
      puts "#{nimp}:#{nreg}: *** Fecha del hecho en formato desconocido "\
        "'#{fecha}'"
      fechad = Date.new(2000, 6, 15)
      pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
    end
  else
    puts "#{nimp}:#{nreg}: *** Registro sin fecha del hecho '#{fecha}'"
    fechad = Date.new(2000, 6, 15)
    pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
  end
  if fechanac
    pf = fechanac.split("/")
    if pf.count == 3
      fechanacd = Date.strptime(fechanac, "%m/%d/%Y")
    else
      puts "#{nimp}:#{nreg}: *** Fecha de nacimiento en formato desconocido "\
        "'#{fechanac}'"
      if fechanac.to_i >= 1900 and fechanac.to_i <= 2020
        fechanacd = if edad.to_i > 0 && (fechad.year - edad.to_i) == fechanac.to_i
          Date.new(fechanac.to_i, fechad.month, fechad.day) - 1
        else
          Date.new(fechanac.to_i, fechad.month, fechad.day) + 1
        end
        pcaso << "Fecha de nacimiento desconocida '#{fechanac}', "\
          "empleando fecha del hecho #{fechad} " +
          (edad.to_i > 0 ? "y la edad #{edad.to_i}" : "") +
          " para asignar #{fechanacd}"
      end
    end
  end
  if edad
    ei = edad.to_i
    if fechanacd.nil?
      fechanacd = Date.new(fechad.year - ei, fechad.month, fechad.day) - 1
      pcaso << "Con edad #{ei} y fecha del caso #{fechad}, estableciendo fecha de nacimiento #{fechanacd}"
    end
    ec = Sivel2Gen::RangoedadHelper.edad_de_fechanac_fecha(
      fechanacd.year,
      fechanacd.month,
      fechanacd.day,
      fechad.year,
      fechad.month,
      fechad.day,
    )
    if ei != ec
      puts "#{nimp}:#{nreg}: *** Registro con edad #{ei} no corresponde "\
        "con la edad calculada #{ec}"
      pcaso << "Edad calculada #{ec}, usando la fecha del hecho #{fechad} y la fecha de nacimiento #{fechanacd},  no corresponde a la del registro #{ei}"
    end
  end
  if fechanacd
    rp["anionac"] = fechanacd.year
    rp["mesnac"] = fechanacd.month
    rp["dianac"] = fechanacd.day
  end

  sexo = "S"
  if r["GENERO"]
    if r["GENERO"] != "M" and r["GENERO"] != "F"
      puts "#{nimp}:#{nreg}: *** Genero desconocido #{r["GENERO"]}"
    else
      sexo = r["GENERO"]
    end
  end
  rp["sexo"] = sexo

  ru = {}
  puts r["DEPARTAMENTO"]
  rd = r["DEPARTAMENTO"]
  if rd
    pd = Msip::Departamento.where(pais_id: 170)
      .where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", rd)
    if pd.count == 1 || (pd.count > 1 && (pd = Msip::Departamento
        .where(pais_id: 170)
        .where("upper(unaccent(nombre))=upper(unaccent(?))", rd)).count == 1)
      d = pd.take
      ru = {
        departamento_id: d.id,
      }
      pm = r["LUGAR DE LOS HECHOS"]
      if pm
        pindex = pm.index(".")
        nm = pindex ? pm[0, pindex - 1] : nil
        m = Msip::Municipio.where(departamento_id: d.id)
          .where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", pm)
        if m.count == 1
          ru[:municipio_id] = m.take.id
        elsif m.count > 1 && (m = Msip::Municipio
            .where(departamento_id: d.id)
            .where("upper(unaccent(nombre))=upper(unaccent(?))",
              pm)).count == 1
          ru[:municipio_id] = m.take.id
        elsif nm && (m = Msip::Municipio
              .where(departamento_id: d.id)
              .where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'",
                nm)).count == 1
          ru[:municipio_id] = m.take.id
        elsif d.nombre == "Cundinamarca" && pm == "BOGOTA"
          ru[:departamento_id] = 4
          ru[:municipio_id] = 24
        else
          ru[:lugar] = pm
        end
      end
    else
      puts "#{nimp}:#{nreg}: *** Departamento #{rd} desconocido"
      pcaso << "Departamento desconocido, dejando el caso sin ubicación"
    end
  else
    puts "#{nimp}:#{nreg}: *** Registro sin departamento"
    pcaso << "Caso sin ubicación"
  end

  rpr = []
  presp = r["PRESUNTOS RESPONSABLES"]
  ppresp = presp.to_s.split(",")
  ppresp.each do |np|
    np = np.gsub(/  */, " ").gsub(/^ /, "").gsub(/ $/, "")
    if !tpresp.keys.include?(np)
      puts "#{nimp}:#{nreg}: *** Presunto responsable sin homologacion '#{np}'"
    else
      rpra = {
        presponsable_id: tpresp[np],
      }
      if tpresp[np] == 14 && np.upcase != "PARAMILITARES"
        rpra[:bloque] = np
      else
        rpra[:otro] = np
      end
      rpr << rpra
    end
  end

  fr = r["FECHA REGISTRO"]
  begin
    fechareg = Date.strptime(fr, "%m/%d/%Y")
  rescue Exception
    puts "#{nimp}:#{nreg}: *** Fecha de registro con formato desconocido "\
      "'#{fr}'"
    fechareg = Date.today
    pcaso << "Fecha del caso desconocida '#{fr}'. Asignando la del dia de la importación"
  end

  codigofasol = r["CODIGO"] || ""
  if (pcod = codigofasol.split("/")).count == 3
    codigofasol = pcod[2] + "-" + pcod[0]
  end
  rc = {
    fecha: fechad.to_s,
    memo: r["OBSERVACIONES"] || "Sin descripción",
    marbetefasol: r["MARBETE"] || "",
    codigofasol: codigofasol,
    ayudafasol: r["AYUDA DE FASOL"] || "",
    observacionfasol: r["OBSERVACION"] || "",
    created_at: fechareg,
  }
  rv = {
    anotaciones: r["NO PERSONAS"] || "",
  }

  # REGIONAL
  rreg1 = nil
  rreg2 = nil
  reg = r["REGIONAL"]
  if reg
    if !treg[reg]
      puts "#{nimp}:#{nreg}: *** Regional no homologable '#{reg}'"
    else
      mreg = treg[reg]
      rreg1 = {
        region_id: mreg[0],
      }
      unless mreg[1].nil?
        rreg2 = {
          region_id: mreg[1],
        }
      end
    end
  end

  cargo = r["CARGO"]
  ce = cargo_entidad[cargo]
  if ce
    rv["cargoestado_id"] = ce[0]
    rv["entidad_id"] = ce[1]
  else
    puts "#{nimp}:#{nreg}: *** Cargo/Entidad del estado desconocidos '#{cargo}'"
    pcaso << "Caso sin cargo/entidad (#{cargo})"
  end
  rv[:detallevinculoestado] = cargo

  # CARPETAS
  carp = r["CARPETAS"]
  rfuente = {}
  if carp
    rfuente = {
      fuenteprensa_id: 30,
      ubicacionfisica: carp,
      fecha: fechareg,
    }
  end

  p = Msip::Persona.create!(rp)

  # FAMILIAR
  fam = r["FAMILIAR"]
  if fam
    menserror = ""
    fa = Msip::ImportaHelper.separa_apellidos_nombres(fam, menserror)
    if menserror != ""
      puts "#{nimp}:#{nreg}: *** Familiar. #{menserror}"
    else
      f = Msip::Persona.create!(
        nombres: fa[0],
        apellidos: fa[1],
        sexo: "S",
      )
      Msip::PersonaTrelacion.create!(
        persona1: p.id,
        persona2: f.id,
        trelacion_id: "SI",
      )
    end
  end

  rc[:id] = nreg + 1001
  c = Sivel2Gen::Caso.create!(rc)
  rv[:caso_id] = c.id
  rv[:persona_id] = p.id
  Sivel2Gen::Victima.create!(rv)
  if ru[:departamento_id]
    ru[:caso_id] = c.id
    ru[:pais_id] = 170
    u = Msip::Ubicacion.create!(ru)
    c.ubicacion_id = u.id
    c.save!
  end
  polounico = nil
  npolounico = ""
  rpr.each do |rpra|
    rpra[:caso_id] = c.id
    polo = Sivel2Gen::CasoPresponsable.connection.execute("SELECT sivel2_gen_polo_id(#{rpra[:presponsable_id]})")[0]["sivel2_gen_polo_id"]
    if polounico.nil? && polo.to_i > 0
      polounico = polo
      npolounico = Sivel2Gen::Presponsable.find(polounico).nombre
    elsif polounico != polo
      polounico = "NO"
    end
  end
  if rpr == []
    rpr << { presponsable_id: 35 }
  end

  if rreg1
    rreg1[:caso_id] = c.id
    Sivel2Gen::CasoRegion.create!(rreg1)
  end
  if rreg2
    rreg2[:caso_id] = c.id
    Sivel2Gen::CasoRegion.create!(rreg2)
  end
  if rfuente && rfuente[:fecha]
    rfuente[:caso_id] = c.id
    rfuente[:id] = nreg + 1001
    of = Sivel2Gen::CasoFuenteprensa.create(rfuente)
    unless of.valid?
      debugger
    end
    of.save!
  end

  ractos = []
  rcat = ""
  [
    "Muerte",
    "Tortura",
    "Atentado",
    "Amenaza",
    "Desaparición",
    "Detención",
    "Exilio",
    "Secuestro",
    "Desplazamiento",
    "Judicialización",
    "Otras Afectaciones",
  ].each do |cat|
    racto = nil
    next unless r[cat]

    rcat << cat + " - " + r[cat] + ". "
    racto = {}
    scf = r[cat]
    if tcat.keys.include?([cat, scf, polounico])
      rc = tcat[[cat, scf, polounico]]
      racto[:categoria_id] = rc[0]
      if rc[1] != ""
        puts "#{nimp}:#{nreg}: *** Polo #{npolounico} (#{polounico}). Categoria: #{cat} - #{scf}. #{rc[1]}"
        pcaso << "Polo #{npolounico} (#{polounico}). Categoria: #{cat} - #{scf}. #{rc[1]}"
      end
      ractos << racto
      if rc[0] >= 1000 && rc[0] <= 1024
        sin_presponsable(rpr)
      end
    else
      puts "#{nimp}:#{nreg}: *** Categoria desconocida o no conciliable con polo del presunto responsable #{npolounico} (#{polounico}). #{cat} - #{scf}"
      pcaso << "Categoria desconocida o no conciliable con polo del presunto responsable #{npolounico} (#{polounico}). #{cat} - #{scf}"
    end
  end

  rpr.each do |rpra|
    rpra[:caso_id] = c.id
  end

  ractos.each do |racto|
    racto[:caso_id] = c.id
    racto[:persona_id] = p.id
    rpr.each do |rpra|
      if rpra[:presponsable_id].nil?
        rpra[:id_responsable] = if racto[:categoria_id] >= 1000 && racto[:categoria_id] <= 1025
          50
        else
          35
        end
      end
      if Sivel2Gen::CasoPresponsable.where(rpra).count == 0
        Sivel2Gen::CasoPresponsable.create!(rpra)
      end
      racto[:presponsable_id] = rpra[:presponsable_id]
      if Sivel2Gen::Acto.where(racto).count == 0
        Sivel2Gen::Acto.create!(racto)
      end
    end
  end

  if r["OBSERVACION"].to_s != ""
    so = Msip::Solicitud.create!(
      id: nreg + 1001,
      usuario_id: 1,
      fecha: Date.today,
      solicitud: r["OBSERVACION"],
    )
    Sivel2Gen::CasoSolicitud.create!(
      id: nreg + 1001,
      solicitud_id: so.id,
      caso_id: c.id,
    )
  end

  Msip::Bitacora.create!(
    fecha: fechareg,
    usuario_id: 1,
    modelo: "Sivel2Gen::Caso",
    modelo_id: nreg + 1001,
    operacion: "iniciar",
  )

  pcaso.each do |prob|
    Sivel2Gen::CasoEtiqueta.create!(
      caso_id: c.id,
      etiqueta_id: 4, # ERROR_IMPORTACIÓN
      usuario_id: 1,
      fecha: Date.today,
      observaciones: prob,
    )
  end
end

Sivel2Gen::Acto.connection.execute(<<-SQL)
  SELECT setval('public.caso_etiqueta_seq', 3000);
  SELECT setval('public.msip_persona_id_seq', 3000);
  SELECT setval('public.sivel2_gen_caso_id_seq', 3000);
  SELECT setval('public.caso_presponsable_seq', 3000);
  SELECT setval('public.sivel2_gen_caso_fuenteprensa_seq', 3000);
  SELECT setval('public.msip_ubicacion_id_seq', 3000);
  SELECT setval('public.victima_seq', 3000);
  SELECT setval('public.msip_persona_id_seq', 3000);
  SELECT setval('public.msip_persona_trelacion_id_seq', 3000);
SQL

STDERR.puts "#{nreg} registros leidos"
STDERR.puts tpresp
