# frozen_string_literal: true

require "sivel2_gen/version"

Msip.setup do |config|
  config.ruta_anexos = ENV.fetch(
    "MSIP_RUTA_ANEXOS",
    "#{Rails.root}/archivos/anexos/",
  )
  config.ruta_volcados = ENV.fetch(
    "MSIP_RUTA_VOLCADOS",
    "#{Rails.root}/archivos/bd/",
  )
  # En heroku los anexos son super-temporales
  if ENV["HEROKU_POSTGRESQL_MAUVE_URL"]
    config.ruta_anexos = "#{Rails.root}/tmp/"
  end
  config.titulo = "SISFASOL #{Sivel2Gen::VERSION}"

  config.colorom_fondo = "#f2f2f2"
  config.colorom_color_fuente = "#000000"
  config.colorom_nav_ini = "#038c33"
  config.colorom_nav_fin = "#03a63c"
  config.colorom_nav_fuente = "#f2f2f2"
  config.colorom_fondo_lista = "#03a63c"
  config.colorom_color_flota_subitem_fuente = "#f2f2f2"
  config.colorom_color_flota_subitem_fondo = "#038c33"
  config.colorom_btn_primario_fondo_ini = "#03a63c"
  config.colorom_btn_primario_fondo_fin = "#03a63c"
  config.colorom_btn_primario_fuente = "#f2f2f2"
  config.colorom_btn_peligro_fondo_ini = "#d62424"
  config.colorom_btn_peligro_fondo_fin = "#d62424"
  config.colorom_btn_peligro_fuente = "#f2f2f2"
  config.colorom_btn_accion_fondo_ini = "#f2f2f2"
  config.colorom_btn_accion_fondo_fin = "#8c8c8c"
  config.colorom_btn_accion_fuente = "#000000"
  config.colorom_alerta_exito_fondo = "#03a63c"
  config.colorom_alerta_exito_fuente = "#f2f2f2"
  config.colorom_alerta_problema_fondo = "#f8d7da"
  config.colorom_alerta_problema_fuente = "#721c24"
end
