#!/usr/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

# Importa base general de aportantes de fiscalía de un CSV

d = Date.today.day

require "csv"

if ARGV.length != 1
  STDERR.puts "Primer argumento debe ser CSV por importar"
  exit 1
end

region_region = {
  "RISARALDA" => "EJE CAFETERO - RISARALDA"
}

region_depto = {
  "ARMENIA" => "QUINDÍO",
  "BOGOTÁ" => "BOGOTÁ, D.C.",
  "CARTAGENA" => "BOLIVAR",
  "EJE - RISARALDA" => "RISARALDA",
  "EJE CAFETERO - CALDAS" => "CALDAS",
  "EJE CAFETERO - CHOCO" => "CHOCO",
  "EJE CAFETERO - QUINDIO" => "QUINDÍO",
  "EJE CAFETERO - RISARALDA" => "RISARALDA",
  "MEDELLIN ANTIOQUIA" => "ANTIOQUIA",
  "PASTO NARIÑO" => "NARIÑO",
  "POPAYAN" => "CAUCA",
  "RIOHACHA GUAJIRA" => "LA GUAJIRA"
}

cargo_entidad = {
  "1 PISO PALACIO" => [33, 31],
  "106 DDHH" => [33, 10002],
  "112 SECCIONAL" => [33, 10003],
  "117 LOCAL" => [33, 31],
  "139 FISCALIA SECCIONAL" => [33, 31],
  "156 ESPECIALIZADA" => [33, 31],
  "188 LOCAL" => [33, 31],
  "2 PISO PALACIO" => [33, 31],
  "3 PISO PALACIO " => [33, 31],
  "32 SECCIONAL" => [33, 31],
  "ABOGADO ASESOR" => [3, 31],
  "ADMON PUBLICA MEDELLIN" => [33, 31],
  "AGENTE DE PROTECCION " => [42, 31],
  "ALMACENISTA" => [2, 31],
  "ARAUCA" => [33, 31],
  "ASESOR JURIDICO TRIBUNALES" => [3, 30],
  "ASESOR UNIDAD FISCAL" => [3, 31],
  "ASIGNACIONES" => [33, 31],
  "ASISTENTE" => [4, 31],
  "ASISTENTE ADMINISTRATIVO" => [5, 31],
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
  "ASISTENTE SOCIAL" => [9, 31],
  "ASITENTE SOCIAL 1" => [9, 31],
  "AUXILIAR " => [4, 31],
  "AUXILIAR ADMINISTRATIVO" => [5, 31],
  "AUXILIAR JUDICIAL" => [8, 31],
  "AUXILIAR JUDICIAL 2" => [8, 31],
  "CESPA" => [33, 31],
  "CITADOR 3" => [10, 31],
  "CITADOR GRADO 3" => [10, 31],
  "CITADOR JUZGADO" => [10, 31],
  "CITADORA" => [10, 31],
  "CITADORA 3" => [10, 31],
  "CONDUCTOR" => [11, 31],
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
  "COORDINADORA BIENESTAR" => [43, 31],
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
  "FOTOGRAFO" => [17, 31],
  "Funcionaria Fiscalia" => [33, 31],
  "FUNCIONARIO CTI" => [33, 311],
  "FUNCIONARIO JUDICIAL" => [33, 31],
  "INFANCIA Y ADOLESCENCIA" => [16, 31],
  "INGENIERO SISTEMAS" => [33, 31],
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
  "NO REGISTRA" => [33, 31],
  "NO REGISTRA " => [33, 31],
  "NOTIFICADOR" => [23, 30],
  "NOTIFICADOR GRADO 3" => [23, 30],
  "OCAÑA" => [33, 31],
  "ODONTOLOGO FORENSE" => [24, 30],
  "OFICIAL MAYOR" => [25, 30],
  "OFICIAL MAYOR JUZGADO" => [25, 30],
  "OFICIAL MAYOR JUZGADO PROMISCUO DE FAMILIA" => [25, 30],
  "PALACIO NACIONAL" => [33, 31],
  "PAMPLONA" => [33, 31],
  "PATIOS" => [33, 31],
  "PERITO EN AUTOMOTORES" => [26, 30],
  "PERSONERO" => [27, 42],
  "presidente del Tribunal Superior de Valledupar" => [28, 30],
  "PRESIDENTE TRIBUNAL SUPERIOR" => [28, 30],
  "PROCURADOR PROVINCIA" => [29, 30],
  "PROFESIONAL " => [44, 31],
  "PROFESIONAL EN GESTION" => [30, 31],
  "PROFESIONAL EN GESTION 3" => [30, 1],
  "SECRETARIA CIRCUITO" => [32, 30],
  "secretaria de la Fiscalía Sexta" => [32, 31],
  "SECRETARIO" => [32, 31],
  "SECRETARIO ADMINISTRATIVO JUZGADO" => [32, 31],
  "SECRETARIO AUXILIAR" => [32, 31],
  "SECRETARIO DE JUZGADO" => [32, 30],
  "SECRETARIO ENCARGADO" => [32, 31],
  "SECRETARIO JUDICIAL" => [32, 30],
  "SECRETARIO JUZGADO" => [32, 30],
  "SECRETARIO JUZGADO CIVIL CIRCUITO RIOSUCIO CALDAS" => [32, 30],
  "SECRETARIO JUZGADO MUNICIPAL" => [32, 30],
  "SECRETARIO NOMINADO" => [32, 31],
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
  "TECNICO ADMINISTRATIVO 2" => [36, 31],
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

trmes = {
  "ene" => 1,
  "feb" => 2,
  "mar" => 3,
  "abr" => 4,
  "may" => 5,
  "jun" => 6,
  "jul" => 7,
  "ago" => 8,
  "sept" => 9,
  "oct" => 10,
  "nov" => 11,
  "dic" => 12
}

nimp = ARGV[0]
STDERR.puts "Leyendo donantes de #{nimp}"
impcsv = CSV.read(nimp, headers: true)
encimp = impcsv[0].headers
STDERR.puts "Se leyeron #{impcsv.count} registros de #{nimp}"
if encimp.count != 29 ||
    !encimp.include?("#") ||
    !encimp.include?("Cedula") ||
    !encimp.include?("Apellidos") ||
    !encimp.include?("Nombres") ||
    !encimp.include?("abr-20") ||
    !encimp.include?("jun-20") ||
    !encimp.include?("jul-20") ||
    !encimp.include?("ago-20") ||
    !encimp.include?("sept-20") ||
    !encimp.include?("oct-20") ||
    !encimp.include?("nov-20") || 
    !encimp.include?("dic-20") ||
    !encimp.include?("ene-21") ||
    !encimp.include?("feb-21") ||
    !encimp.include?("mar-21") ||
    !encimp.include?("abr-21") ||
    !encimp.include?("may-21") ||
    !encimp.include?("jun-21") ||
    !encimp.include?("jul-21") ||
    !encimp.include?("ago-21") ||
    !encimp.include?("sept-21") ||
    !encimp.include?("oct-21") ||
    !encimp.include?("nov-21") ||
    !encimp.include?("dic-21") ||
    !encimp.include?("DEPARTAMENTO ") ||
    !encimp.include?("mail") ||
    !encimp.include?("celular") ||
    !encimp.include?("Cargo") ||
    !encimp.include?("Seccional")
  puts "El CSV #{nimp} no tiene los encabezados esperados"
  exit 1
end

idrep = 0
nomrep = 0
nreg = 0
numerr = 0
prob = CSV.generate do |csvprob|
  csvprob << ["#", "Cedula", "Apellidos", "Nombres", "abr-20", "jun-20", "jul-20", "ago-20", "sept-20", "oct-20", "nov-20", "dic-20", "ene-21", "feb-21", "mar-21", "abr-21", "may-21", "jun-21", "jul-21", "ago-21", "sept-21", "oct-21", "nov-21", "dic-21", "DEPARTAMENTO ", "mail", "celular", "Cargo", "Seccional", "Error"]
  impcsv.each do |r|
    nreg += 1
    STDERR.puts nreg
    preg = [] # Problemas en el registro (pero que permiten crearlo)
    menserror = "".dup  #Errores (que no permiten crearlo)

    rp = {}
    rp["nombres"] = r["Nombres"] == '' ? "N" : r["Nombres"]
    rp["apellidos"] = r["Apellidos"] == '' ? "N" : r["Apellidos"]
    if r["Cedula"]
      rp["numerodocumento"] = r["Cedula"].gsub(/[^0-9]/, '') 
      rp["tdocumento_id"] = Msip::Tdocumento.where(sigla: "CC")[0].id
    else
      rp["tdocumento_id"] = 11
      rp["numerodocumento"] = nreg.to_s + "P"
    end

    pidrep = Msip::Persona.where(numerodocumento: rp["numerodocumento"]).take
    pnomrep = Msip::Persona.
      where("unaccent(nombres) ILIKE unaccent(?)", rp["nombres"]).
      where("unaccent(apellidos) ILIKE unaccent(?)", rp["apellidos"]).take
    if pidrep && (!pnomrep || pidrep.id != pnomrep.id)
      idrep += 1
      menserror << "Identificación repetida con persona #{pidrep.id} - #{pidrep.nombres} #{pidrep.apellidos} (#{pidrep.tdocumento.sigla} #{pidrep.numerodocumento}). "
    end

    if pnomrep && (!pidrep || pidrep.id != pnomrep.id)
      nomrep += 1
      menserror << "Nombre repetido con persona #{pnomrep.id} - #{pnomrep.nombres} #{pnomrep.apellidos} (#{pnomrep.tdocumento.sigla} #{pnomrep.numerodocumento}). "
    end

    if region_depto[r["DEPARTAMENTO "]]
      rds = region_depto[r["DEPARTAMENTO "]].split("-")
    else
      rds = r["DEPARTAMENTO "].split("-")
    end
    rd = rds[0].strip
    pd = Msip::Departamento.where(pais_id: 170)
      .where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", rd)
    if pd.count == 1 
      d = pd.take
      rp["ultimo_departamento_trabajo_id"] = d.id
    else 
      pd = Msip::Departamento.where(pais_id: 170)
        .where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", rds[1])
      if pd.count == 1 
        d = pd.take
        rp["ultimo_departamento_trabajo_id"] = d.id
      end
    end
    if rds.count == 1 || (rds.count == 2 && rd[1] = " correo laura ")
      rd = rds[0].strip
    else
      rd = rds[0].strip + " - " + rds[1].strip
    end

    if region_region[rd]
      rd = region_region[rd]
    end
    pr = Regionpago.where('unaccent(nombre) ILIKE unaccent(?)', rd)
    if pr.count == 0
      debugger
    else
      rp["ultima_regionpago_id"] = pr.take.id
    end

    if r["mail"]
      rp["ultimo_correo_trabajo"] = r["mail"]
    end
    if r["celular"]
      rp["ultimo_celular_trabajo"] = r["celular"]
    end

    cargo = r["Cargo"]
    ce = cargo_entidad[r["Cargo"]]
    if ce
      rp["ultimo_cargoestado_id"] = ce[0]
      rp["ultima_entidad_id"] = ce[1]
    else
      preg << "Persona sin cargo/entidad (#{cargo})"
    end


    if menserror == ""
      if pidrep && pnomrep && pidrep.id == pnomrep.id
        persona = pidrep
      else
        persona = Msip::Persona.create(rp)
        # Máxima id iba en 1907
      end

      ["abr-20","jun-20","jul-20","ago-20","sept-20","oct-20","nov-20","dic-20","ene-21","feb-21","mar-21","abr-21","may-21","jun-21","jul-21","ago-21","sept-21","oct-21","nov-21","dic-21"].each do |ma|
        mad = ma.split("-")
        mes = trmes[mad[0]]
        anio = mad[1].to_i + 2000
        valor = 0
        if r[ma]
          valor = r[ma].gsub(/[^0-9]/, '')
        end
        
        aporte = Aporte.create(
          persona_id: persona.id,
          anio: anio,
          mes: mes,
          valor: valor.to_i
        )
      end

    else

      csvprob << [ 
        r["#"],r["Cedula"],r["Apellidos"],r["Nombres"],
        r["abr-20"],r["jun-20"],r["jul-20"],r["ago-20"],r["sept-20"],
        r["oct-20"],r["nov-20"],r["dic-20"],r["ene-21"],r["feb-21"],
        r["mar-21"],r["abr-21"],r["may-21"],r["jun-21"],r["jul-21"],
        r["ago-21"],r["sept-21"],r["oct-21"],r["nov-21"],r["dic-21"],
        r["DEPARTAMENTO "],r["mail"],r["celular"],r["Cargo"],
        r["Seccional"],menserror
      ]
      numerr += 1

    end
  end
end #csvprob

puts prob

STDERR.puts "Registros con problemas #{numerr}"
exit 0

##  Sivel2Gen::Acto.connection.execute(<<-SQL)
##  SELECT setval('public.caso_etiqueta_seq', 3000);
##  SELECT setval('public.msip_persona_id_seq', 3000);
##  SELECT setval('public.sivel2_gen_caso_id_seq', 3000);
##  SELECT setval('public.caso_presponsable_seq', 3000);
##  SELECT setval('public.sivel2_gen_caso_fuenteprensa_seq', 3000);
##  SELECT setval('public.msip_ubicacion_id_seq', 3000);
##  SELECT setval('public.victima_seq', 3000);
##  SELECT setval('public.msip_persona_id_seq', 3000);
##  SELECT setval('public.msip_persona_trelacion_id_seq', 3000);
##  SQL
##
