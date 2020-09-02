Rails.application.routes.draw do
  resources :vertientes
  resources :tipo_documentos
  resources :subcuencas
  resources :statuses
  resources :proyecto_programas
  resources :proyecto_areas
  resources :municipios
  resources :microcuencas
  resources :investigaciones
  resources :instituciones
  resources :facultades_institutos
  resources :departamentos
  resources :cuencas
  resources :area_investigacions
  resources :areas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
