Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :entity do
    resources :records, only: [:index]
    resources :fields
    resources :favourites, only: [:create]
  end

  resources :entities

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
