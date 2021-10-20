Rails.application.routes.draw do
  resources :cat_concursos
  resources :media_metadatos
  resources :usuario_metadatos
  resources :cat_metadatos
  resources :direcciones
  resources :categorias
  resources :usuarios
  resources :medias
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'entre_azul_y_verde/inicio#index'

  namespace 'entre_azul_y_verde' do
	  root 'inicio#index'
	  get 'quees' => 'inicio#index'
	  get 'categorias' => 'inicio#index'
	  get 'medios' => 'inicio#index'
	  
	  
	  get 'bases' => 'inicio#bases'
	  resources :galerias
	  resources :panel
	  resources :registro
  end

end
