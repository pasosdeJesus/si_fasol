#!/usr/bin/env ruby
# encoding: utf-8

# Importa datos de un CSV

d=Date.today.day

require 'csv'

if ARGV.length != 1
  STDERR.puts "Primer argumento debe ser CSV por importar"
  exit 1
end

nimp = ARGV[0]
STDERR.puts "Leyendo casos de #{nimp}"
impcsv = CSV.read(nimp, headers: true)
encimp = impcsv[0].headers
STDERR.puts "Se leyeron #{impcsv.count} registros de #{nimp}"
if !encimp.include?('NO PERSONAS') || 
  !encimp.include?('CEDULA') ||
  !encimp.include?('NOMBRE DEL SERVIDOR') ||
  !encimp.include?('FECHA DE NACIMIENTO') ||
  !encimp.include?('EDAD HECHO') ||
  !encimp.include?('GENERO') ||
  !encimp.include?('CARGO') ||
  !encimp.include?('Muerte') ||
  !encimp.include?('Tortura') ||
  !encimp.include?('Herido') ||
  !encimp.include?('Atentado') ||
  !encimp.include?('Amenaza') ||
  !encimp.include?('Desaparición') ||
  !encimp.include?('Detención') ||
  !encimp.include?('Exilio') ||
  !encimp.include?('Secuestro') ||
  !encimp.include?('Desplazamiento') ||
  !encimp.include?('Judicialización') ||
  !encimp.include?('Otras Afectaciones') ||
  !encimp.include?('FECHA HECHO') ||
  !encimp.include?('LUGAR DE LOS HECHOS') ||
  !encimp.include?('DEPARTAMENTO') ||
  !encimp.include?('PRESUNTOS RESPONSABLES') ||
  !encimp.include?('OBSERVACIONES') ||
  !encimp.include?('FECHA REGISTRO') ||
  !encimp.include?('AYUDA DE FASOL') ||
  !encimp.include?('COMPETENCIA DE FASOL') ||
  !encimp.include?('CARPETAS') ||
  !encimp.include?('REGIONAL') ||
  !encimp.include?('FAMILIAR') ||
  !encimp.include?('CODIGO') ||
  !encimp.include?('MARBETE') ||
  !encimp.include?('OBSERVACION')
  puts "El CSV #{nimp} no tiene los encabezados esperados"
  exit 1
end

nreg = 0
impcsv.each do |r|
  nreg += 1
  pcaso = [] # Problemas en el caso
  menserror = ''
  pa = Sip::ImportaHelper.separa_apellidos_nombres(
    r['NOMBRE DEL SERVIDOR'], menserror)
  if menserror != ''
    puts "#{nimp}:#{nreg}: *** #{menserror}"
  end
  rp = { nombres: pa[0], apellidos: pa[1]}
  if r['CEDULA']
    rp['numerodocumento'] = r['CEDULA']
    rp['tdocumento_id'] = Sip::Tdocumento.where(sigla: 'CC')[0].id
  end
  fechad = nil
  fecha = r['FECHA HECHO']
  fechanacd = nil
  fechanac = r['FECHA DE NACIMIENTO']
  if fechanac
    pf = fechanac.split('/')
    if pf.count == 3
      fechanacd = Date.strptime(fechanac, '%m/%d/%Y')
    else
      puts "#{nimp}:#{nreg}: *** Fecha de nacimiento en formato desconocido "\
        "'#{fechanac}'"
      if fechanac.to_i>=1900 and fechanac.to_i<=2020
        fechanacd = Date.new(fechanac.to_i, 6, 15)
        pcaso << "Fecha de nacimiento desconocida '#{fechanac}', "\
          "asignando #{fechanacd.to_s}"
      end
    end
  end
  if fecha
    pf = fecha.split('/')
    if pf.count == 3
      begin
        fechad = Date.strptime(fecha, '%m/%d/%Y')
      rescue Exception
        puts "#{nimp}:#{nreg}: *** Fecha del hecho en formato desconocido "\
          "'#{fecha}'"
        fechad=Date.new(2000,6,15)
        pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
      end
    else
      puts "#{nimp}:#{nreg}: *** Fecha del hecho en formato desconocido "\
        "'#{fecha}'"
      fechad=Date.new(2000,6,15)
      pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
    end
  else
      puts "#{nimp}:#{nreg}: *** Registro sin fecha del hecho '#{fecha}'"
      fechad=Date.new(2000,6,15)
      pcaso << "Fecha del caso desconocida, asignada 2000-06-15"
  end
  edad = r['EDAD HECHO']
  if edad
    ei = edad.to_i
    if !fechanacd.nil?
      ec = Sivel2Gen::RangoedadHelper.edad_de_fechanac_fecha(
        fechanacd.year, fechanacd.month, fechanacd.day,
        fechad.year, fechad.month, fechad.day)
      if ei != ec 
        puts "#{nimp}:#{nreg}: *** Registro con edad #{ei} no corresponde "\
          "con la edad calculada #{ec}"
        if (ei+1)!=ec
          pcaso << "Diferencia notable ente edad en el registro #{ei}, con "\
            " edad calculada con fecha de nacimiento, "\
            " manteniendo fecha de nacimiento ${fechanacd.to_s}"
        end
      end
    else
      fechanacd=Date.new(fechad.year - ei, fechad.month, fechad.day)+1
      pcaso << "Con edad #{ei} estableciendo fecha de nacimiento #{fechanacd.to_s}"
    end
  end
  if fechanacd
    rp['anionac']=fechanacd.year
    rp['mesnac']=fechanacd.month
    rp['dianac']=fechanacd.day
  end

  sexo = 'S'
  if r['GENERO']
    if r['GENERO'] != 'M' and r['GENERO'] != 'F'
      puts "#{nimp}:#{nreg}: *** Genero desconocido #{r['GENERO']}"
    else
      sexo = r['GENERO']
    end
  end
  rp['sexo']=sexo

#CARGO
#Muerte
#Tortura
#Herido
#Atentado
#Amenaza
#Desaparición
#Detención
#Exilio
#Secuestro
#Desplazamiento
#Judicialización
#Otras Afectaciones
#LUGAR DE LOS HECHOS
#DEPARTAMENTO
#PRESUNTOS RESPONSABLES
#FECHA REGISTRO
#AYUDA DE FASOL
#CARPETAS
#REGIONAL
#FAMILIAR
#OBSERVACION

  ru = {}
  puts r['DEPARTAMENTO']
  rd =r['DEPARTAMENTO']
  if rd
    pd = Sip::Departamento.where(id_pais: 170).
      where("unaccent(nombre) ILIKE unaccent(?)",rd) 
    if pd.count == 1
      d = pd.take
      ru = {
        id_departamento: d.id
      }
      pm = r['LUGAR DE LOS HECHOS']
      if pm
        m = Sip::Municipio.where(id_departamento: d.id).
          where("unaccent(nombre) ILIKE unaccent(?)", pm) 
        if m.count == 1
          ru[:id_municipio] = m.take.id
        else
          ru[:lugar] = pm
        end
      end
    else
      puts "#{nimp}:#{nreg}: *** Departamento #{nd} desconocido"
      pcaso << "Departamento desconocido, dejando el caso sin ubicación"
      debugger
    end
  else
      puts "#{nimp}:#{nreg}: *** Registro sin departamento"
      pcaso << "Caso sin ubicación"
  end
  rc = {
    fecha: fechad.to_s,
    memo: r['OBSEREVACIONES'] || 'Sin descripción',
    marbetefasol: r['MARBETE'] || '',
    codigofasol: r['CODIGO'] || '',


  }
  rv = {
    anotaciones: r['NO PERSONAS'] || ''
  }

  p = Sip::Persona.new(rp)
  c = Sivel2Gen::Caso.new(rc)
  rv[:id_caso] = c.id
  rv[:id_persona] = p.id
  v = Sivel2Gen::Victima.new(rv)
  ru[:id_caso] = c.id
  u = Sip::Ubicacion.new(ru)

  
end
STDERR.puts "#{nreg} registros leidos"

