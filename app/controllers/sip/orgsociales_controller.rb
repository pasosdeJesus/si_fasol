require 'sip/concerns/controllers/orgsociales_controller'

module Sip
  class OrgsocialesController < Sip::ModelosController
    before_action :set_orgsocial, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sip::Orgsocial

    include Sip::Concerns::Controllers::OrgsocialesController

    def atributos_index
      [ :id, 
        :grupoper_id,
        :tipoorg_id,
        :subde_id,
        { :sectororgsocial_ids => [] },
        { :orgsocial_persona => [] },
        :web,
        :habilitado,
        :created_at_localizada
      ]
    end

    def atributos_show
      [ :id, 
        :grupoper_id,
        :tipoorg_id,
        :subde_id,
        { :sectororgsocial_ids => [] },
        { :orgsocial_persona =>  [] },
        :web,
        :pais_id,
        :direccion,
        :telefono,
        :fax,
        :created_at_localizada,
        :fechadeshabilitacion_localizada
      ]
    end


  end
end
