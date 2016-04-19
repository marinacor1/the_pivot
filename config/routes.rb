Rails.application.routes.draw do
  root "coders#index"

  resources :coders, only: [:index]

  resources :categories, only: [:show]

  resources :teams, only: [:create, :index]
end
