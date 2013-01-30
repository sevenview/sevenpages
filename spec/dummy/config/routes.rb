Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, :class_name => "Sevenpages::User"

  mount Sevenpages::Engine => "/sevenpages"

  get ':slug', to: 'sevenpages/public/pages#show', as: :page
end
