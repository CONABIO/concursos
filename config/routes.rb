Rails.application.routes.draw do
  devise_for :users
  devise_for :user_ayv, :controllers => {:confirmations => "entre_azul_y_verde/devise/confirmations", :passwords => "entre_azul_y_verde/devise/passwords", :registrations => "entre_azul_y_verde/devise/registrations", :unlocks => "entre_azul_y_verde/devise/unlocks", :sessions => "entre_azul_y_verde/devise/sessions"}

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
