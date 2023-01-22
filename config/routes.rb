Rails.application.routes.draw do


  rutarel = ENV.fetch('RUTA_RELATIVA', 'sivel2/')
  scope rutarel do

    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy'

      # El siguiente para superar mala generación del action en el formulario
      # cuando se monta en sitio diferente a / y se autentica mal (genera
      # /puntomontaje/puntomontaje/usuarios/sign_in )
      if (Rails.configuration.relative_url_root != '/')
        ruta = File.join(Rails.configuration.relative_url_root,
                         'usuarios/sign_in')
        post ruta, to: 'devise/sessions#create'
        get  ruta, to: 'devise/sessions#new'
      end
    end

    devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
      get 'usuarios/edit' => 'devise/registrations#edit',
        :as => 'editar_registro_usuario'
      put 'usuarios/:id' => 'devise/registrations#update',
        :as => 'registro_usuario'
    end
    resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' }

    get '/casos/mapaosm' => 'sivel2_gen/casos#mapaosm'

    get '/casos/numcasos' => 'sivel2_gen/casos#numcasos'

    get '/fasol/banco' => 'sivel2_gen/conteos#fasol_banco',
      as: :banco
    
    get '/fasol/banco_regionales' => 
      'sivel2_gen/conteos#fasol_banco_regionales',
      as: :banco_regionales
    
    get '/fasol/banco_detalle/:regional' => 
      'sivel2_gen/conteos#fasol_banco_detalle',
      as: :banco_detalle

      get '/fasol/banco_detreg' => 
      'sivel2_gen/conteos#fasol_banco_detreg',
      as: :banco_detreg


    get '/orgsociales/jerarquia' => 'msip/orgsociales#jerarquia',
      as: :jerarquia_orgsociales

    namespace :admin do
      ab = ::Ability.new
      ab.tablasbasicas.each do |t|
        if (t[0] == "")
          c = t[1].pluralize
          resources c.to_sym,
            path_names: { new: 'nueva', edit: 'edita' }
        end
      end
    end

    root 'sivel2_gen/hogar#index'
  end # scope

  mount Msip::Engine, at: rutarel, as: 'msip'
  mount Mr519Gen::Engine, at: rutarel, as: 'mr519_gen'
  mount Heb412Gen::Engine, at: rutarel, as: 'heb412_gen'
  mount Sivel2Gen::Engine, at: rutarel, as: 'sivel2_gen'
  mount Cor1440Gen::Engine, at: rutarel, as: 'cor1440_gen'

end
