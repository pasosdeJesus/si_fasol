# frozen_string_literal: true

class ApplicationController < Msip::ApplicationController
  protect_from_forgery with: :exception
  # No requiere autorización

  # Se hace en msip ahora
  #if defined?(WEBrick)
  #  WEBrick::HTTPRequest.const_set("MAX_URI_LENGTH", 100240)
  #end

end
