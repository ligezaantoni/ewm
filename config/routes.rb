Rails.application.routes.draw do

  resources :abilities
  resources :activities
  resources :activity_forms
  resources :addresses
  resources :character_traits
  resources :educational_methods
  resources :execution_reports
  resources :events
  resources :related_people
  resources :schools
  resources :teams do
    resources :scouts
  end
  root to: 'home#index'

  devise_for :users

end
