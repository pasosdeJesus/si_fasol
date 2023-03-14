require 'jos19/concerns/models/persona'

module Msip
  class Persona < ActiveRecord::Base
    include Jos19::Concerns::Models::Persona


    # Registros msip_persona_trelacion en los que
    # esta persona aparece como persona2 y la
    # persona1 es víctima en un caso
    def como_familiar_de_victima
      self.persona_trelacion2.where(
        "msip_persona_trelacion.persona1 IN "\
        "(SELECT id_persona FROM sivel2_gen_victima)").order(
          :persona1
        )
    end

  end
end
