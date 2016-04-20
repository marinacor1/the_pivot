Rails.application.routes.draw do
  root "homes#show"
  resources :homes, only: [:show]

  resources :coders, only: [:index, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]

  resources :categories, only: [:show]

  resources :teams, only: [:create, :index, :destroy]
end
