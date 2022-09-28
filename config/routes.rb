Rails.application.routes.draw do
  resources :games
  resources :players
  resources :phases
  resources :boards
  resources :teams
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
