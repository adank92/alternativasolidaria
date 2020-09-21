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
    resources :collaborations, controller: 'teams/collaborations'
  end
  resources :team_templates do
    resources :collaborations, controller: 'team_templates/collaborations'
    resources :teams, only: [:create], controller: 'team_templates/teams'
  end
end
