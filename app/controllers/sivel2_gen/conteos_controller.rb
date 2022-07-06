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


  end
end
