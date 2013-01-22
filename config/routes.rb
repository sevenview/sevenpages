Sevenpages::Engine.routes.draw do
  root to: 'home#index'

  resources :pages
end
