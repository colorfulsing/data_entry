Rails.application.routes.draw do
  devise_for :users, skip: [:new, :create]
  devise_scope :user do
   resources :users, path: "usuarios", only: [:new, :create], controller: 'registrations'
   resources :users, path: "usuarios", only: [:show, :edit, :update], controller: 'usuarios'
  end

  get '/', to: 'default#home', as: :home
  get '/buscar', to: 'default#search', as: :search

  resources :vertientes
  resources :tipo_documentos
  resources :tipo_institutos
  resources :subcuencas
  resources :statuses
  resources :proyectos
  resources :municipios
  resources :microcuencas

  # Add spanish route names
  resources :investigaciones
  get "/investigaciones/new(.:format)", to: 'investigaciones#new', as: :new_investigacion
  get "/investigaciones/:id/edit(.:format)", to: 'investigaciones#edit', as: :edit_investigacion
  get "/investigaciones/:id(.:format)", to: 'investigaciones#show', as: :investigacion
  patch "/investigaciones/:id(.:format)", to: 'investigaciones#update'
  put "/investigaciones/:id(.:format)", to: 'investigaciones#update'
  delete "/investigaciones/:id(.:format)", to: 'investigaciones#destroy'

  # Add spanish route names
  resources :instituciones
  get "/instituciones/new(.:format)", to: 'instituciones#new', as: :new_institucion
  get "/instituciones/:id/edit(.:format)", to: 'instituciones#edit', as: :edit_institucion
  get "/instituciones/:id(.:format)", to: 'instituciones#show', as: :institucion
  patch "/instituciones/:id(.:format)", to: 'instituciones#update'
  put "/instituciones/:id(.:format)", to: 'instituciones#update'
  delete "/instituciones/:id(.:format)", to: 'instituciones#destroy'

  # Add spanish route names
  resources :facultades
  get "/facultades/new(.:format)", to: 'facultades#new', as: :new_facultad
  get "/facultades/:id/edit(.:format)", to: 'facultades#edit', as: :edit_facultad
  get "/facultades/:id(.:format)", to: 'facultades#show', as: :facultad
  patch "/facultades/:id(.:format)", to: 'facultades#update'
  put "/facultades/:id(.:format)", to: 'facultades#update'
  delete "/facultades/:id(.:format)", to: 'facultades#destroy'

  resources :departamentos
  resources :cuencas
  resources :areas

  # Add asociation route names
  post "/proyectos/:id/asociate_area/(.:format)", to: 'proyectos#asociate_area', as: :proyecto_asociate_area
  post "/investigaciones/:id/asociate_area/(.:format)", to: 'investigaciones#asociate_area', as: :investigacion_asociate_area

  # Add autocomplete route names
  get "/autocomplete/cuencas", to: 'cuencas#autocomplete', as: :cuencas_autocomplete
  get "/autocomplete/subcuencas", to: 'subcuencas#autocomplete', as: :subcuencas_autocomplete
  get "/autocomplete/microcuencas", to: 'microcuencas#autocomplete', as: :microcuencas_autocomplete
  get "/autocomplete/municipios", to: 'municipios#autocomplete', as: :municipios_autocomplete
  get "/autocomplete/facultades", to: 'facultades#autocomplete', as: :facultades_autocomplete

  # Add user routes
  get "/usuarios", to: 'usuarios#index', as: :usuarios
  get "/usuarios/:id(.:format)/enable", to: 'usuarios#enable', as: :enable_usuario
  get "/usuarios/:id(.:format)/disable", to: 'usuarios#disable', as: :disable_usuario
  delete "/usuarios/:id(.:format)", to: 'usuarios#destroy', as: :delete_usuario

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
