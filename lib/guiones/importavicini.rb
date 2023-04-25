#!/usr/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

#
# Importación inicial de víctimas
# Dominio público de acuerdo a la legislación colombiana.
# vtamara@pasosdeJesus.org 2022

# u = Usuario.where(nusuario: "vtamara").take || Usuario.take

require "csv"

if ARGV.length != 1
  STDERR.puts "Primer argumento debe ser CSV con víctimas por importar"
  exit 1
end

def a_mayusculas(texto)
  if texto.nil? || texto == "" || texto == "null"
    return ""
  end

  r = texto.upcase
  r.gsub!("á", "Á")
  r.gsub!("é", "É")
  r.gsub!("í", "Í")
  r.gsub!("ó", "Ó")
  r.gsub!("ú", "Ú")
  r.gsub!("ü", "Ü")
  r
end

nvic = ARGV[0]
STDERR.puts "Leyendo Archivo con víctimas #{nvic}"
viccsv = CSV.read(nvic, headers: true)
STDERR.puts "Se leyeron #{viccsv.count} registros de #{nvic}"

encvic = viccsv[0].headers
if !encvic.include?("NO PERSONAS") ||
    !encvic.include?("CEDULA") || !encvic.include?("NOMBRE DEL SERVIDOR") ||
    !encvic.include?("FECHA DE NACIMIENTO") ||
    !encvic.include?("EDAD HECHO") ||
    !encvic.include?("GENERO") ||
    !encvic.include?("CARGO") |
        !encvic.include?("Muerte") ||
    !encvic.include?("Tortura") ||
    !encvic.include?("Herido") ||
    !encvic.include?("Atentado") ||
    !encvic.include?("Amenaza") ||
    !encvic.include?("Desaparición") ||
    !encvic.include?("Detención") ||
    !encvic.include?("Exilio") ||
    !encvic.include?("Secuestro") ||
    !encvic.include?("Desplazamiento") ||
    !encvic.include?("Judicialización") ||
    !encvic.include?("Otras Afectaciones") ||
    !encvic.include?("FECHA HECHO") ||
    !encvic.include?("LUGAR DE LOS HECHOS") ||
    !encvic.include?("DEPARTAMENTO") ||
    !encvic.include?("PRESUNTOS RESPONSABLES") ||
    !encvic.include?("OBSERVACIONES") ||
    !encvic.include?("FECHA REGISTRO") ||
    !encvic.include?("AYUDA DE FASOL") ||
    !encvic.include?("COMPETENCIA DE FASOL") ||
    !encvic.include?("CARPETAS") ||
    !encvic.include?("REGIONAL") ||
    !encvic.include?("FAMILIAR") ||
    !encvic.include?("CODIGO") ||
    !encvic.include?("MARBETE") ||
    !encvic.include?("OBSERVACION")
  STDERR.puts "Archivo con víctimas no tiene encabezados necesarios"
end

nreg = 0
viccsv.each do |r|
  nreg += 1
  # puts r
  fecha = r["FECHA HECHO"]
  if fecha.nil?
    puts "#{nvic}:#{nreg}: *** Fecha del hecho en nil, asignando 2000-06-15"
    fecha = "2000-06-15"
  else
    puts "OJO fecha=#{fecha}"
  end
  c = Sivel2Gen::Caso.create(
    fecha: r["FECHA HECHO"],
    memo: r["OBSERVACION"] || " ",
  )
  menserr = ""
  sep = Msip::ImportaHelper.separa_apellidos_nombres(
    r["NOMBRE DEL SERVIDOR"], menserr
  )
  nombres = sep[0]
  # puts "OJO nombres=#{nombres}, apellidos=#{apellidos}"
  if menserr != ""
    puts "#{nvic}:#{nreg}: *** #{menserr}"
  end

  if r["FECHA DE NACIMIENTO"].nil? && !r["EDAD HECHO"].nil?
    r["EDAD HECHO"]
    puts "#{nvic}:#{nreg}: *** Fecha de nacimiento y edad en nil"
  end
  # !encvic.include?(') ||
  # !encvic.include?('EDAD HECHO') ||
  # !encvic.include?('CARGO') ||

  sexo = r["GENERO"].to_s.gsub(/^  */, "")
  if sexo != "M" && sexo != "F" && sexo != ""
    puts "#{nvic}:#{nreg}: *** Genero desconocido: '#{sexo}'"
  end
  if sexo == ""
    sexo = Msip::Persona::convencion_sexo[:sexo_sininformacion]
  end

  p = Msip::Persona.create(
    nombres: nombres,
    apellidos: nombres,
    numerodocumento: r["CEDULA"],
    sexo: sexo,
  )
  Sivel2Gen::Victima.create(
    anotaciones: r["NO PERSONAS"],
    persona_id: p.id,
    caso_id: c.id,
  )

  #      puts "Registro creado"
end
STDERR.puts "Registros leidos: #{nreg}"
