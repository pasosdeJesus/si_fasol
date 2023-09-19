
class AportesController < ApplicationController

  load_and_authorize_resource class: ::Aporte

  before_action :prepara_persona

  # Para llamar vista con formato turbo stream
  def destroy
  end

  # Para llamar vista con formato turbo stream
  def create
  end

  private

  def prepara_persona
    @persona = Msip::Persona.new(
      aporte: [::Aporte.new]
    )
  end

end # included
