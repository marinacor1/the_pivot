Rails.application.routes.draw do
  root "homes#show"
  resources :homes, only: [:show]

  resources :coders, only: [:index, :show]

  namespace :admin do
    get "/dashboard", to: "users#show", as: :dashboard
    resources :users, only: [:edit, :update]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get "/dashboard", to: "users#show", as: :dashboard

  resources :contracts, only: [:create, :show]

  get "/history", to: "contracts#index"

  resources :teams, only: [:create, :index, :destroy]

  get "/:slug", to: "categories#show", as: :category
end
