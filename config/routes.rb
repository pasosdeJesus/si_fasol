# frozen_string_literal: true

Rails.application.routes.draw do

  devise_scope :usuario do
    get "sign_out" => "devise/sessions#destroy"
    get "salir" => "devise/sessions#destroy",
      as: :terminar_sesion

    post "usuarios/iniciar_sesion",
      to: "devise/sessions#create"
    get "usuarios/iniciar_sesion",
      to: "devise/sessions#new",
      as: :iniciar_sesion

    # El siguiente para superar mala generación del action en el formulario
    # cuando se monta en sitio diferente a / y se autentica mal (genera
    # /puntomontaje/puntomontaje/usuarios/sign_in )
    if Rails.configuration.relative_url_root != "/"
      ruta = File.join(
        Rails.configuration.relative_url_root,
        "usuarios/sign_in",
      )
      post ruta, to: "devise/sessions#create"
      get  ruta, to: "devise/sessions#new"
    end
  end

  devise_for :usuarios, skip: [:registrations], module: :devise
  as :usuario do
    get "usuarios/edit" => "devise/registrations#edit",
      :as => "editar_registro_usuario"
    put "usuarios/:id" => "devise/registrations#update",
      :as => "registro_usuario"
  end

  resources :acto, only: [], param: :index do
    member do
      delete '(:id)', to: "sivel2_gen/actos#destroy", as: "eliminar"
      post '/', to: "sivel2_gen/actos#create", as: "crear"
    end
  end

  resources :aporte, only: [], param: :index do
    member do
      delete '(:id)', to: "aportes#destroy", as: "eliminar"
      post '/', to: "aportes#create", as: "crear"
    end
  end

  get "aportes/actualizacion_masiva",
    to:"msip/personas#actualizacion_masiva",
    as: :aportes_actualizacion_masiva
  patch "aportes/actualizacion_masiva",
    to: "msip/personas#hacer_actualizacion_masiva",
    as: :aportes_hacer_actualizacion_masiva

  resources :homonimos, path_names: { new: "nuevo", edit: "edita" },
    controller: "msip/homonimos"

  resources :usuarios, path_names: { new: "nuevo", edit: "edita" }



  get "/aliadoasiste/nuevo" => "cor1440_gen/actividades#nuevo_aliadoasiste",
    as: :nuevo_aliadoasiste

  #get "/consaportante/:id" => "msip/personas#show",
  #  as: :consaportante
  get "/consaportantes" => "consaportantes#index",
    as: :consaportantes

  get "/casos/mapaosm" => "sivel2_gen/casos#mapaosm"

  get "/casos/numcasos" => "sivel2_gen/casos#numcasos"

  get "/fasol/banco" => "sivel2_gen/conteos#fasol_banco",
    as: :banco

  get "/fasol/banco_regionales" =>
  "sivel2_gen/conteos#fasol_banco_regionales",
    as: :banco_regionales

  get "/fasol/banco_detalle/:regional" =>
  "sivel2_gen/conteos#fasol_banco_detalle",
    as: :banco_detalle

  get "/fasol/banco_detreg" =>
  "sivel2_gen/conteos#fasol_banco_detreg",
    as: :banco_detreg

  get "/orgsociales/jerarquia" => "msip/orgsociales#jerarquia",
    as: :jerarquia_orgsociales

  get '/personas/nombresrepetidos' => 'msip/personas#nombresrepetidos',
    as: :personas_nombresrepetidos

  namespace :admin do
    ab = Ability.new
    ab.tablasbasicas.each do |t|
      next unless t[0] == ""

      c = t[1].pluralize
      resources c.to_sym,
        path_names: { new: "nueva", edit: "edita" }
    end
  end

  root "sivel2_gen/hogar#index"
  # scope

  mount Jos19::Engine, at: "/", as: "jos19"
  mount Sivel2Gen::Engine, at: "/", as: "sivel2_gen"
  mount Cor1440Gen::Engine, at: "/", as: "cor1440_gen"
  mount Heb412Gen::Engine, at: "/", as: "heb412_gen"
  mount Mr519Gen::Engine, at: "/", as: "mr519_gen"
  mount Msip::Engine, at: "/", as: "msip"
end
