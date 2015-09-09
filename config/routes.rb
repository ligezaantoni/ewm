Rails.application.routes.draw do
  
  # Ewidencja
  resources :teams do
    resources :schools, only: [:edit, :update, :new, :create, :destroy] do
      resources :officials, only: [:edit, :update, :new, :create, :destroy]
    end
    resources :scouts, only: [:show, :edit, :update, :new, :create, :destroy] do
      resources :parents, only: [:edit, :update, :new, :create, :destroy]
      resources :individual_tasks, only: [:index, :edit, :update, :new, :create, :destroy]
    end
    resources :goals, only: [:index, :edit, :update, :new, :create, :destroy]
  end
  
  # Edukacja
  resources :tasks
  
  # Planowanie
  resources :events do
    resource :sort_activities_order, only: [:edit, :update], controller: 'activities/sort_order'
    resources :activities, only: [:index, :edit, :update, :new, :create, :destroy]
    resources :execution_reports, only: [:index]
  end
  
  # Ocena
  resources :scores, only: [:index, :show, :new, :create, :destroy]
  
  # Zarządzanie danymi
  
  resources :profiles, only: [:edit, :update]
  
  get '/admin', to: 'admin#index'
  namespace :admin do
    resources :abilities
    resources :activity_forms
    resources :character_traits, only: [:index, :edit, :update, :new, :create, :destroy]
  end
  
  root to: 'home#index'

  devise_for :users

end
