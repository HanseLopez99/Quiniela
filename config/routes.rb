Rails.application.routes.draw do
  resources :games
  resources :phases
  resources :boards
  resources :teams
  
  # Route for scoreboard page
  get 'scoreboard', to: 'scoreboard#show'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end

  # Defines the root path route ("/")
  root "home#index"
end
