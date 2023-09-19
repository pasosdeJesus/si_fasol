# frozen_string_literal: true

require "jos19/concerns/models/persona"

module Msip
  class Persona < ActiveRecord::Base
    include Jos19::Concerns::Models::Persona

    has_many :aporte,
      foreign_key: "persona_id", 
      validate: true,
      dependent: :destroy,
      class_name: "::Aporte"
    accepts_nested_attributes_for :aporte,
      allow_destroy: true, 
      reject_if: :all_blank

    validates :tdocumento_id, presence: true, allow_blank: false
    validates :numerodocumento, presence: true, allow_blank: false,
      uniqueness: { scope: :tdocumento,
                    message: "Tipo y número de documento repetido" 
      }

    validate :sindoc_estandar
    def sindoc_estandar
      if tdocumento_id == 11
        if tdocumento_id == 11 && id && numerodocumento && 
            numerodocumento.to_s != '' && 
            numerodocumento.to_i != self.id && 
            (numerodocumento[-1] < 'A' || numerodocumento[-1] > 'Z')
          errors.add(:numerodocumento, "Número de documento #{numerodocumento} "\
                     "con tipo SIN DOCUMENTO  debe ser el "\
                     "número de la persona (i.e #{self.id}) o "\
                     "un número seguido de letras (e.g 2190C)")
        end
      end
    end


    # Registros msip_persona_trelacion en los que
    # esta persona aparece como persona2 y la
    # persona1 es víctima en un caso
    def como_familiar_de_victima
      persona_trelacion2.where(
        "msip_persona_trelacion.persona1 IN "\
          "(SELECT persona_id FROM sivel2_gen_victima)",
      ).order(
        :persona1,
      )
    end
  end
end
