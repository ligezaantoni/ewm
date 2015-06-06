Rails.application.routes.draw do

  resources :teams
  resources :schools
  resources :abilities
  resources :activity_forms
  resources :character_traits
  resources :educational_methods
  resources :execution_reports
  resources :activities
  resources :events
  resources :related_people
  resources :addresses
  resources :scouts
  root to: 'home#index'

  devise_for :users

end
