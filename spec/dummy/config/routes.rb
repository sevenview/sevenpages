Rails.application.routes.draw do
  root to: 'home#index'

  mount Sevenpages::Engine => "/sevenpages"

  get ':slug', to: 'sevenpages/public/pages#show', as: :page
end
