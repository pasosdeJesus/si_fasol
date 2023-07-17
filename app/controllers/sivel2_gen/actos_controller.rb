#require 'sivel2_gen/concerns/controllers/actos_controller'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto
    #include Sivel2Gen::Concerns::Controllers::ActoController
    
    include ActionView::Helpers::AssetUrlHelper
    before_action :prepara_caso
    # Crea una nueva etiqueta para el caso que recibe por parametro
    # params[:caso_id].  Pone valores simples en los campos requeridos
    def nueva
      if params[:caso_id]
        @acto = Sivel2Gen::Acto.new
        @acto.caso_id = params[:caso_id]
        @acto.etiqueta_id = Msip::Etiqueta.count > 0 ? Msip::Etiqueta.take.id : 0
        @acto.usuario_id = current_usuario.id
        @acto.fecha = Date.today
        if @acto.save
          respond_to do |format|
            format.js { render text: @acto.id.to_s }
            format.json { render json: @acto.id.to_s, status: :created }
            format.html { render inline: @acto.id.to_s }
          end
        else
          respond_to do |format|
            format.html {
              render inline: "error: #{@acto.errors.messages} "
            }
            format.json { render json: @acto.errors.messages,
                          status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      end
    end # def nueva

    def new
    end

    def destroy
    end

    def create
    end

    def update
    end

    private

    def prepara_caso
      @caso = Sivel2Gen::Caso.new(
        acto: [Sivel2Gen::Acto.new])
    end


  end 
end
