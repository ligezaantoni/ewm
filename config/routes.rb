Rails.application.routes.draw do

  resources :abilities
  resources :activities
  resources :activity_forms
  resources :addresses
  resources :character_traits
  resources :educational_methods
  resources :execution_reports
  resources :events
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
