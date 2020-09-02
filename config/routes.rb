Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:index]
  resources :localities, only: [:index]
  resources :recipes, onlye: [:index]
end
