# frozen_string_literal: true

require_relative "boot"
require "rails"
# Elige los marcos de trabajo que necesitas:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"


# Requiere gemas listas en el Gemfile, incluyendo las
# limitadas a :test, :development, o :production.
Bundler.require(*Rails.groups)

module Sivel2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    config.load_defaults Rails::VERSION::STRING.to_f

    config.autoload_lib(ignore: %w(assets tasks))

    config.action_view.form_with_generates_remote_forms = false

    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "America/Bogota"

    #Evita deshabilitar butones en formularios anidados dinámicos
    config.action_view.automatically_disable_submit_tag = false

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    puts "CONFIG_HOSTS=" + ENV.fetch("CONFIG_HOSTS", "defensor.info").to_s
    config.hosts.concat(
      ENV.fetch("CONFIG_HOSTS", "defensor.info").downcase.split(";"),
    )

    config.relative_url_root = ENV.fetch("RUTA_RELATIVA", "/fasol/si")

    config.action_dispatch.default_headers = {
      "X-Frame-Options" => "ALLOWALL",
    }

    config.x.origen_cors = ENV.fetch("ORIGEN_CORS", "").split(",")
    puts "config.x.origen_cors=#{config.x.origen_cors.inspect}"

    # msip
    config.x.formato_fecha = ENV.fetch("MSIP_FORMATO_FECHA", "dd/M/yyyy")

    config.x.msip_docid_obligatorio = true

    # heb412
    config.x.heb412_ruta = Pathname(
      ENV.fetch("HEB412_RUTA", Rails.public_path.join("heb412").to_s),
    )

    # sivel2
    config.x.sivel2_consulta_web_publica =
      (ENV["SIVEL2_CONSWEB_PUBLICA"] && ENV["SIVEL2_CONSWEB_PUBLICA"] != "")

    config.x.sivel2_consweb_max = ENV.fetch("SIVEL2_CONSWEB_MAX", 2000)

    config.x.sivel2_consweb_pie = ENV.fetch("SIVEL2_CONSWEB_PIE", "")

    config.x.sivel2_consweb_epilogo = ENV.fetch(
      "SIVEL2_CONSWEB_EPILOGO",
      "<br>Si requiere más puede suscribirse a SIVeL Pro",
    ).html_safe

    config.x.sivel2_mapaosm_diasatras = ENV.fetch(
      "SIVEL2_MAPAOSM_DIASATRAS", 182
    )

    config.x.cor1440_edita_poblacion = false

    config.x.cor1440_pf_comunes =
      ENV.fetch("COR1440_PF_COMUNES", 0).to_i

    config.x.cor1440_pf_todaact =
      ENV.fetch("COR1440_PF_TODAACT", 0).to_i

    config.x.cor1440_pf_calidad =
      ENV.fetch("COR1440_PF_CALIDAD", 0).to_i

    config.x.jos19_etiquetaunificadas = 'PERSONAS UNIFICADAS'

    config.railties_order = [:main_app, Jos19::Engine, 
                             Cor1440Gen::Engine, Sivel2Gen::Engine,
                             Heb412Gen::Engine, Mr519Gen::Engine, 
                             Msip::Engine, :all]

  end
end
