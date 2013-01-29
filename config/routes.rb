Sevenpages::Engine.routes.draw do
  root to: 'home#index'

  resources :pages do
    member do
      get :content_edit
    end
  end
end
