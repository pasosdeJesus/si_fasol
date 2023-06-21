# frozen_string_literal: true

class ApplicationController < Msip::ApplicationController
  protect_from_forgery with: :exception
  # No requiere autorización

  if WEBrick
    WEBrick::HTTPRequest.const_set("MAX_URI_LENGTH", 10240)
  end

end
