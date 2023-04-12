# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "acts_as_list"

gem "apexcharts",
  git: "https://github.com/styd/apexcharts.rb.git",
  branch: :master

gem "babel-transpiler"

gem "bcrypt"

gem "best_in_place", git: "https://github.com/mmotherwell/best_in_place"

gem "bootsnap", ">=1.1.0", require: false

gem "cancancan"

gem "cocoon",
  git: "https://github.com/vtamara/cocoon.git",
  branch: "new_id_with_ajax" # Formularios anidados (algunos con ajax)

gem "coffee-rails" # CoffeeScript para recuersos .js.coffee y vistas

gem "color"

gem "devise" # Autenticación y roles

gem "devise-i18n"

gem "hotwire-rails"

gem "jbuilder" # API JSON facil. Ver: https://github.com/rails/jbuilder

gem "jsbundling-rails"

gem "kt-paperclip", # Anexos
  git: "https://github.com/kreeti/kt-paperclip.git"

gem "libxml-ruby"

gem "odf-report" # Genera ODT

gem "nokogiri", ">=1.11.1"

gem "parslet"

gem "pg" # Postgresql

gem "prawn" # Generación de PDF

gem "prawnto_2", require: "prawnto"

gem "prawn-table"

gem "rack"

gem "rack-cors"

gem "rails", "~> 7.0"
# git: 'https://github.com/rails/rails.git', branch: '6-1-stable'

gem "rails-i18n"

gem "redcarpet" # Markdown

gem "rspreadsheet" # Genera ODS

gem "rubyzip", ">= 2.0"

gem "sassc-rails" # Hojas de estilo con SCSS

gem "simple_form" # Formularios simples

gem "sprockets-rails"

gem "stimulus-rails"

gem "turbo-rails", "~> 1.0"

gem "twitter_cldr" # ICU con CLDR

gem "tzinfo" # Zonas horarias

gem "will_paginate" # Listados en páginas

#####
# Motores que se sobrecargan vistas (a diferencia de las anteriores gemas,
# estas ponerse en orden de apilamiento lógico y no alfabético).

gem "msip", # Motor generico
  git: "https://gitlab.com/pasosdeJesus/msip.git", branch: 'main'
  #path: '../msip'

gem "mr519_gen", # Motor de gestion de formularios y encuestas
  git: "https://gitlab.com/pasosdeJesus/mr519_gen.git", branch: 'main'
 #path: '../mr519_gen'

gem "heb412_gen", # Motor de nube y llenado de plantillas
  git: "https://gitlab.com/pasosdeJesus/heb412_gen.git", branch: 'main'
  #path: '../heb412_gen'

gem "sivel2_gen", # Motor para manejo de casos
  git: "https://gitlab.com/pasosdeJesus/sivel2_gen.git", branch: 'main'
  #path: '../sivel2_gen'

gem "cor1440_gen",
  git: "https://gitlab.com/pasosdeJesus/cor1440_gen.git", branch: 'main'
  #path: '../cor1440_gen'

gem "jos19",
  git: "https://gitlab.com/pasosdeJesus/jos19.git", branch: 'main'
  #path: '../jos19'

group :development, :test do
  gem "brakeman"

  gem "bundler-audit"

  gem "code-scanning-rubocop"

  gem "colorize"

  gem "debug"

  gem "dotenv-rails"

  gem "rails-erd"

  gem "rubocop-minitest"

  gem "rubocop-rails"

  gem "rubocop-shopify"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"

  gem "connection_pool"

  gem "cuprite"

  gem "minitest", "~> 5.16"

  gem "minitest-reporters"

  gem "rails-controller-testing"

  gem "simplecov"

  gem "spork" # Un proceso para cada prueba -- acelera
end

group :production do
  gem "unicorn" # Para despliegue
end
