Rails.application.routes.draw do
  root to: 'home#index'

  mount Sevenpages::Engine => "/sevenpages"
end
