class ConsaportantesController < Heb412Gen::ModelosController

  load_and_authorize_resource class: ::Consaportante

  def clase
    '::Consaportante'
  end

  def atributos_index
    c = (@columnas.map {|c| c.to_sym}) & ([:actividad_id] + columnas_posibles)
    puts "OJO c=#{c}"
    return c
  end

  def index_reordenar(c)
    c.reorder([:nombres, :apellidos])
  end 

  def vistas_manejadas
    ['Consaportante']
  end

  def columnas_posibles
    cp = [ :id,
      :nombres,
      :apellidos,
      :tdocumento_sigla,
      :numerodocumento,
      :ultimo_departamento_trabajo,
      :ultima_regionpago,
      :ultimo_correo_trabajo,
      :ultimo_celular_trabajo,
      :ultima_entidad_nombre,
      :ultimo_cargoestado,
      :ultimo_aporte
    ]
    (2020..Date.today.year).each do |a|
      (1..12).each do |m|
        cp << "m#{a}_#{m}".to_sym
      end
    end
    cp
  end

  # Genera conteo por caso/beneficiario y tipo de actividad de convenio
  def index
    if params.nil? || params[:filtro].nil?
      params[:filtro] = {}
      params[:filtro][:columnas] = columnas_posibles 
    else
      params[:filtro][:columnas] = columnas_posibles 
    end
    @columnas = [:id] | params[:filtro][:columnas]
    ::Consaportante.refresca_consulta(@columnas)
    index_msip(::Consaportante.all)
  end

end
