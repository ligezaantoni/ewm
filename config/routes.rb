Rails.application.routes.draw do
  
  # Ewidencja
  resources :teams do
    resources :schools do
      resources :officials
    end
    resources :scouts do
      resources :parents
      resources :individual_tasks
    end
    resources :goals
  end
  
  # Edukacja
  resources :tasks
  
  # Planowanie
  resources :events do
    resource :sort_activities_order, only: [:edit, :update], controller: 'activities/sort_order'
    resources :activities do
      resources :execution_reports
    end
  end
  
  # Ocena
  resources :scores
  
  # Zarządzanie danymi
  
  resources :profiles, only: [:edit, :update]
  
  get '/admin', to: 'admin#index'
  namespace :admin do
    resources :abilities
    resources :activity_forms
    resources :educational_methods
    resources :character_traits
  end
  
  root to: 'home#index'

  devise_for :users

end
