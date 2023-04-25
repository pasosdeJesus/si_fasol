# frozen_string_literal: true

Sivel2::Application.config.relative_url_root = ENV.fetch(
  "RUTA_RELATIVA", "/si/fasol"
)
Sivel2::Application.config.assets.prefix = if ENV.fetch(
  "RUTA_RELATIVA", "/si/fasol"
) == "/"
  "/assets"
else
  (ENV.fetch("RUTA_RELATIVA", "/si/fasol") + "/assets")
end
