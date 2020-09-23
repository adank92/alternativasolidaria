Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :edit, :update]
  resources :localities, only: [:index]
  resources :recipes, onlye: [:index]
  resources :destinations
  resources :teams do
    resources :collaborations, only: [:index]
    resources :team_destinations, only: [:index]
  end
end
