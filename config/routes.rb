Rails.application.routes.draw do
  root "homes#show"
  resources :home, only: [:show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]

  resources :coders, only: [:index]

  resources :categories, only: [:show]

  resources :teams, only: [:create, :index]
end
