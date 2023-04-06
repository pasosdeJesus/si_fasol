# encoding: utf-8
# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/conteos_controller"

module Sivel2Gen
  class ConteosController < ApplicationController
    include Sivel2Gen::Concerns::Controllers::ConteosController
    load_and_authorize_resource class: Sivel2Gen::Caso

    def fasol_banco
      sub = "SELECT DISTINCT caso.id AS caso_id, "\
        " categoria_id, ac.persona_id, cat.pconsolidado_id, "\
        " p.nombre AS rotulo "\
        " FROM sivel2_gen_caso AS caso"\
        " JOIN sivel2_gen_acto AS ac ON caso.id=ac.caso_id"\
        " JOIN sivel2_gen_categoria AS cat "\
        "  ON ac.categoria_id=cat.id "\
        " JOIN sivel2_gen_pconsolidado AS p "\
        "  ON p.id=cat.pconsolidado_id "

      r1 = ActiveRecord::Base.connection.select_all(
        "SELECT COUNT(DISTINCT persona_id) FROM (#{sub}) AS sub",
      )
      @numpersonas = r1[0]["count"]

      q4 = "SELECT rotulo, count(*) FROM (#{sub}) AS sub "\
        " GROUP BY 1 ORDER BY 1"

      puts "OJO q4=#{q4}"
      r = ActiveRecord::Base.connection.select_all(q4)
      fila = "rotulo"
      enctabla = []
      inter = {}
      filas = []
      et = ["Acciones violatorias"]
      r.each do |t|
        unless inter[t[fila]]
          inter[t[fila]] = {}
        end
        inter[t[fila]] = t["count"].to_i
        unless filas.include?(t[fila].to_s)
          filas << t[fila].to_s
        end
      end
      enctabla = et

      cuerpotabla = []
      filas.each do |f|
        ft = [f]
        et.each do |_e|
          ft << (inter[f] ? inter[f] : 0)
        end
        cuerpotabla << ft
      end

      @enctabla = enctabla
      @cuerpotabla = cuerpotabla

      respond_to do |format|
        format.html { render("fasol_banco", layout: false) }
        format.json { head(:no_content) }
      end
    end

    def fasol_banco_regionales
      sub = "SELECT DISTINCT caso.id AS caso_id, "\
        " categoria_id, ac.persona_id, cat.pconsolidado_id, "\
        " p.nombre AS rotulo, "\
        "(SELECT r.nombre FROM  sivel2_gen_caso_region AS cr "\
        "  JOIN sivel2_gen_region AS r ON cr.region_id=r.id "\
        "  WHERE cr.caso_id=caso.id LIMIT 1) AS region "\
        " FROM sivel2_gen_caso AS caso"\
        " JOIN sivel2_gen_acto AS ac ON caso.id=ac.caso_id"\
        " JOIN sivel2_gen_categoria AS cat "\
        "  ON ac.categoria_id=cat.id "\
        " JOIN sivel2_gen_pconsolidado AS p "\
        "  ON p.id=cat.pconsolidado_id "

      q4 = "SELECT rotulo, region, count(*) FROM (#{sub}) AS sub "\
        " GROUP BY 1, 2 ORDER BY 1,2"

      puts "OJO q4=#{q4}"
      r = ActiveRecord::Base.connection.select_all(q4)
      fila = "rotulo"
      columna = "region"
      enctabla = []
      inter = {}
      filas = []
      et = []
      r.each do |t|
        unless inter[t[fila].to_s]
          inter[t[fila].to_s] = {}
        end
        unless inter[t[fila].to_s][t[columna].to_s]
          inter[t[fila].to_s][t[columna].to_s] = {}
        end
        inter[t[fila].to_s][t[columna].to_s] = t["count"].to_i
        unless et.include?(t[columna].to_s)
          et << t[columna].to_s
        end
        unless filas.include?(t[fila].to_s)
          filas << t[fila].to_s
        end
      end
      et.sort!
      enctabla << "Hecho de violencia"

      i = 1
      et.each do |e|
        enctabla << CGI.escapeHTML(e)
        i += 1
      end
      cuerpotabla = []
      filas.each do |f|
        ft = [f]
        et.each do |e|
          ft << (inter[f] && inter[f][e] ? inter[f][e] : 0)
        end
        cuerpotabla << ft
      end

      @enctabla = enctabla
      @cuerpotabla = cuerpotabla

      respond_to do |format|
        format.html { render("fasol_banco_regionales", layout: false) }
        format.json { head(:no_content) }
      end
    end

    def fasol_banco_detalle
      preg = params[:regional] ? params[:regional].upcase : "CUNDINAMARCA"
      @enctabla, @cuerpotabla =
        Sivel2Gen::ConteosController.calcula_fasol_banco_detalle(preg)

      respond_to do |format|
        format.html { render("fasol_banco_detalle", layout: false) }
        format.json { head(:no_content) }
      end
    end

    def fasol_banco_detreg
      respond_to do |format|
        format.html { render("fasol_banco_detreg", layout: false) }
        format.json { head(:no_content) }
      end
    end

    def self.calcula_fasol_banco_detalle(preg)
      if preg.nil?
        condreg = "region is NULL"
      else
        c = Sivel2Gen::Region.where(fechadeshabilitacion: nil)
          .where(nombre: preg)
        return if c.count == 0

        condreg = "sub.region = '#{preg}'"
      end
      sub = "SELECT DISTINCT caso.id AS caso_id, "\
        " per.id, per.sexo, re.nombre AS rangoedad, "\
        " categoria_id, cat.pconsolidado_id, p.nombre AS rotulo, "\
        "(SELECT r.nombre FROM  sivel2_gen_caso_region AS cr "\
        "  JOIN sivel2_gen_region AS r ON cr.region_id=r.id "\
        "  WHERE cr.caso_id=caso.id LIMIT 1) AS region "\
        " FROM sivel2_gen_caso AS caso"\
        " JOIN sivel2_gen_acto AS ac ON caso.id=ac.caso_id"\
        " JOIN sivel2_gen_categoria AS cat "\
        "  ON ac.categoria_id=cat.id "\
        " JOIN sivel2_gen_pconsolidado AS p "\
        "  ON p.id=cat.pconsolidado_id "\
        " JOIN msip_persona AS per "\
        "  ON per.id=ac.persona_id "\
        " JOIN sivel2_gen_victima AS vic "\
        "  ON per.id=vic.persona_id AND caso.id=vic.caso_id "\
        " JOIN sivel2_gen_rangoedad AS re "\
        "  ON vic.rangoedad_id=re.id "

      q4 = "SELECT rotulo, rangoedad, sexo, count(*) FROM (#{sub}) AS sub "\
        " WHERE #{condreg}"\
        " GROUP BY 1, 2, 3 ORDER BY 1,2,3"

      puts "OJO q4=#{q4}"
      r = ActiveRecord::Base.connection.select_all(q4)
      fila = "rotulo"
      columna = "rangoedad"
      enctabla = []
      inter = {}
      filas = []
      et = []
      r.each do |t|
        unless inter[t[fila]]
          inter[t[fila]] = {}
        end
        unless inter[t[fila]][t[columna]]
          inter[t[fila]][t[columna]] = {}
        end
        inter[t[fila]][t[columna]][t["sexo"]] = t["count"].to_i
        unless et.include?(t[columna])
          et << t[columna]
        end
        unless filas.include?(t[fila])
          filas << t[fila]
        end
      end
      et.sort!
      enctabla << "Rangos de edad"

      i = 1
      et.each do |e|
        enctabla << CGI.escapeHTML(e)
        i += 1
      end
      cuerpotabla = []
      filas.each do |f|
        ft = [f]
        et.each do |e|
          fem = if inter[f] && inter[f][e] && inter[f][e]["F"]
            inter[f][e]["F"]
          else
            0
          end
          mas = if inter[f] && inter[f][e] && inter[f][e]["M"]
            inter[f][e]["M"]
          else
            0
          end
          sin = if inter[f] && inter[f][e] && inter[f][e]["S"]
            inter[f][e]["S"]
          else
            0
          end
          ft << [fem, mas, sin]
        end
        cuerpotabla << ft
      end

      [enctabla, cuerpotabla]
    end
  end
end
