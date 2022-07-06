# encoding: UTF-8

require 'sivel2_gen/concerns/controllers/conteos_controller'

module Sivel2Gen
  class ConteosController < ApplicationController

    include Sivel2Gen::Concerns::Controllers::ConteosController
    load_and_authorize_resource class: Sivel2Gen::Caso

    def fasol_banco
      pFini = '2010-01-01'
      pFfin = ''
      pTviolencia = ''
      pEtiqueta1 = ''
      pEtiqueta2 = ''
      pExcluirCateRep = ''
      pSegun = ''
      pDepartamento = ''
      pMunicipio = ''
      pCategoria = Sivel2Gen::Categoria.habilitados.pluck(:id)

      @opsegun, @coltotales, @totalesfila, @numpersonas, @enctabla, 
        @cuerpotabla = Sivel2Gen::ConteosController::victimizaciones_gen_tabla(
          pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2,
          "0", pSegun, "0", "0",
          nil, pCategoria, 'RÓTULO'
      )
      respond_to do |format|
        format.html { render 'fasol_banco', layout: false}
        format.json { head :no_content }
      end
    end

    def fasol_banco_regionales
      pFini = '2010-01-01'
      pFfin = ''
      pTviolencia = ''
      pEtiqueta1 = ''
      pEtiqueta2 = ''
      pExcluirCateRep = ''
      pSegun = ''
      pDepartamento = ''
      pMunicipio = ''
      pCategoria = Sivel2Gen::Categoria.habilitados.pluck(:id)

      @opsegun, @coltotales, @totalesfila, @numpersonas, @enctabla, 
        @cuerpotabla = Sivel2Gen::ConteosController::victimizaciones_gen_tabla(
          pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2,
          "0", 'REGIÓN', "0", "0",
          nil, pCategoria, 'RÓTULO'
      )

      respond_to do |format|
        format.html { render 'fasol_banco_regionales', layout: false}
        format.json { head :no_content }
      end
    end

    def fasol_banco_detalle
      preg = params[:regional] ? params[:regional].upcase : 'CUNDINAMARCA'
      c = Sivel2Gen::Region.where(fechadeshabilitacion: nil).
        where(nombre: preg)
      if c.count == 0 
        return
      end
      reg = c.take
      sub = "SELECT DISTINCT caso.id AS caso_id, "\
        " per.id, per.sexo, re.nombre AS rangoedad, "\
        " id_categoria, cat.id_pconsolidado, p.nombre AS rotulo, "\
        "(SELECT r.nombre FROM  sivel2_gen_caso_region AS cr "\
        "  JOIN sivel2_gen_region AS r ON cr.id_region=r.id "\
        "  WHERE cr.id_caso=caso.id LIMIT 1) AS region "\
        " FROM sivel2_gen_caso AS caso"\
        " JOIN sivel2_gen_acto AS ac ON caso.id=ac.id_caso"\
        " JOIN sivel2_gen_categoria AS cat "\
        "  ON ac.id_categoria=cat.id "\
        " JOIN sivel2_gen_pconsolidado AS p "\
        "  ON p.id=cat.id_pconsolidado "\
        " JOIN sip_persona AS per "\
        "  ON per.id=ac.id_persona "\
        " JOIN sivel2_gen_victima AS vic "\
        "  ON per.id=vic.id_persona AND caso.id=vic.id_caso "\
        " JOIN sivel2_gen_rangoedad AS re "\
        "  ON vic.id_rangoedad=re.id "

      q4 = "SELECT rotulo, rangoedad, sexo, count(*) FROM (#{sub}) AS sub "\
        " WHERE sub.region = '#{preg}' "\
        " GROUP BY 1, 2, 3 ORDER BY 1,2,3"


        puts "OJO q4=#{q4}"
        r = ActiveRecord::Base.connection.select_all(q4) 
        fila = 'rotulo'
        columna = 'rangoedad'
        enctabla = []
        inter = {}
        filas = []
        et = []
        r.each do |t|
          if !inter[t[fila]]
            inter[t[fila]] = {}
          end
          if !inter[t[fila]][t[columna]]
            inter[t[fila]][t[columna]] = {}
          end
          inter[t[fila]][t[columna]][t['sexo']] = t['count'].to_i
          if !et.include?(t[columna])
            et << t[columna]
          end
          if !filas.include?(t[fila])
            filas << t[fila]
          end
        end
        et.sort!
        enctabla << 'Rangos de edad'

        i = 1
        et.each do |e|
          enctabla << CGI.escapeHTML(e)
          i += 1
        end
        cuerpotabla = []
        filas.each do |f|
          ft = [f]
          et.each do |e|
            fem = inter[f] && inter[f][e] && inter[f][e]['F'] ? 
              inter[f][e]['F'] : 0
            mas = inter[f] && inter[f][e] && inter[f][e]['M'] ? 
              inter[f][e]['M'] : 0
            sin = inter[f] && inter[f][e] && inter[f][e]['S'] ? 
              inter[f][e]['S'] : 0
            ft << [fem, mas, sin]
          end
          cuerpotabla << ft
        end

        @cuerpotabla = cuerpotabla
        @enctabla = enctabla

        respond_to do |format|
          format.html { render 'fasol_banco_detalle', layout: false}
          format.json { head :no_content }
        end

    end


  end
end
