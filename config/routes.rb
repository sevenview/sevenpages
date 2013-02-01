Sevenpages::Engine.routes.draw do
  root to: 'home#index'

  devise_for :users, :class_name => "Sevenpages::User", module: :devise

  resources :pages
  resources :media_files
end

