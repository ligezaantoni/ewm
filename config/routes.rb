Rails.application.routes.draw do

  resources :abilities
  resources :activity_forms
  resources :educational_methods
  
  # resources :addresses
  # resources :character_traits
  
  resources :events do
    resources :activities do
      resources :execution_reports
    end
  end
  resources :teams do
    resources :schools do
      resources :officials
    end
    resources :scouts do
      resources :parents
    end
  end
  
  root to: 'home#index'

  devise_for :users

end
