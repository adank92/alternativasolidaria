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
    resources :collaborations, controller: 'teams/collaborations', only: [:index]
    resources :team_destinations, controller: 'teams/team_destinations', only: [:index]
  end
  resources :team_templates do
    resources :collaborations, controller: 'team_templates/collaborations', only: [:index]
    resources :team_destinations, controller: 'team_templates/team_destinations', only: [:index]
    resources :teams, controller: 'team_templates/teams', only: [:create]
  end
end
