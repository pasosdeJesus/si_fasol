class Consaportante < ActiveRecord::Base
  include Msip::Modelo

  self.primary_key = "id"

  belongs_to :persona,
    class_name: 'Msip::Persona', 
    foreign_key: 'id', 
    optional: false


  scope :filtro_apellidos, lambda { |apellidos|
    where("unaccent(apellidos) ILIKE '%' || unaccent(?) || '%'", apellidos)
  }

  scope :filtro_nombres, lambda { |nombres|
    where("unaccent(nombres) ILIKE '%' || unaccent(?) || '%'", nombres)
  }

  scope :filtro_numerodocumento, lambda { |nid|
    where("unaccent(numerodocumento) ILIKE '%' || unaccent(?) || '%'", 
          nid)
  }
  scope :filtro_tdocumento_sigla, lambda { |tid|
    where(tdocumento_id: tid)
  }

  scope :filtro_ultimo_departamento_trabajo, lambda { |did|
    where(ultimo_departamento_trabajo_id: did)
  }

  scope :filtro_ultima_regionpago, lambda { |rid|
    where(ultima_regionpago_id: rid)
  }

  scope :filtro_ultimo_correo_trabajo, lambda { |c|
    where("unaccent(ultimo_correo_trabajo) ILIKE '%' || unaccent(?) || '%'", c)
  }

  scope :filtro_ultimo_celular_trabajo, lambda { |c|
    where("unaccent(ultimo_celular_trabajo) ILIKE '%' || unaccent(?) || '%'", c)
  }

  #scope :filtro_ultima_entidad_nombre, lambda { |e|
  #  where("unaccent(ultima_entidad_nombre) ILIKE '%' || unaccent(?) || '%'", e)
  #}

  scope :filtro_ultima_entidad_nombre, lambda { |id|
    where("ultima_entidad_id IN "\
          "(select entidadessubde(?))", id)
  }

  scope :filtro_ultimo_cargoestado, lambda { |cid|
    where(ultimo_cargoestado_id: cid)
  }


  def ultimo_aporte
    self.persona.ultimo_aporte
  end

  def presenta(atr)
    puts "** ::Consaportante atr=#{atr.to_s.parameterize}"

    if respond_to?("#{atr.to_s.parameterize}")
      return send("#{atr.to_s.parameterize}")
    end

    persona.presenta(atr)
  end # presenta


  CONSULTA='consaportante'

  def self.interpreta_ordenar_por(campo)
    critord = ""
    #      case campo.to_s
    #      when /^fechadesc/
    #        critord = "fecha desc"
    #      when /^fecha/
    #        critord = "fecha asc"
    #      else
    #        raise(ArgumentError, "Ordenamiento invalido: #{ campo.inspect }")
    #      end
    critord += "nombres, apellidos"
    return critord
  end

  def self.consulta
    cons = "SELECT msip_persona.id AS id,"\
      "msip_persona.nombres,"\
      "msip_persona.apellidos,"\
      "msip_persona.tdocumento_id,"\
      "msip_tdocumento.sigla AS tdocumento_sigla,"\
      "msip_persona.numerodocumento,"\
      "msip_persona.ultimo_departamento_trabajo_id,"\
      "msip_persona.ultima_regionpago_id,"\
      "msip_persona.ultimo_correo_trabajo,"\
      "msip_persona.ultimo_celular_trabajo,"\
      "msip_persona.ultima_entidad_id,"\
      "msip_grupoper.nombre AS ultima_entidad_nombre,"\
      "msip_persona.ultimo_cargoestado_id"

    (2020..Date.today.year).each do |anio|
      (1..12).each do |mes|
        cons += ", (SELECT valor FROM aporte AS a "\
          "WHERE a.persona_id=msip_persona.id AND a.anio=#{anio} "\
          "AND a.mes=#{mes} limit 1) AS m#{anio}_#{mes}"
      end
    end
    cons += " FROM msip_persona "\
      "JOIN msip_tdocumento ON msip_tdocumento.id=tdocumento_id "\
      "LEFT JOIN msip_orgsocial ON msip_orgsocial.id=ultima_entidad_id "\
      "LEFT JOIN msip_grupoper ON msip_grupoper.id=msip_orgsocial.grupoper_id "\
      "WHERE msip_persona.id IN (SELECT persona_id FROM aporte WHERE valor>0)"
    #      puts cons
    return cons
  end

  def self.crea_consulta(ordenar_por = nil)
    if ARGV.include?("db:migrate")
      return
    end
    if ActiveRecord::Base.connection.data_source_exists? CONSULTA
      ActiveRecord::Base.connection.execute(
        "DROP MATERIALIZED VIEW IF EXISTS #{CONSULTA}")
    end
    w = ''
    #if ordenar_por
    #  w += ' ORDER BY ' + self.interpreta_ordenar_por(ordenar_por)
    #else
    #  w += ' ORDER BY ' + self.interpreta_ordenar_por('fechadesc')
    #end
    ActiveRecord::Base.connection.execute("CREATE 
                MATERIALIZED VIEW #{CONSULTA} AS
                #{self.consulta}
                #{w} ;")
  end # def crea_consulta

  def self.refresca_consulta(ordenar_por = nil)
    if !ActiveRecord::Base.connection.data_source_exists? "#{CONSULTA}"
      crea_consulta(ordenar_por = nil)
      ActiveRecord::Base.connection.execute(
        "CREATE UNIQUE INDEX on #{CONSULTA} (id);")
    else
      ActiveRecord::Base.connection.execute(
        "REFRESH MATERIALIZED VIEW #{CONSULTA}")
    end
  end

end

