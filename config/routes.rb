Rails.application.routes.draw do
  root "homes#show"
  resources :homes, only: [:show]
  resources :coders, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :contracts, only: [:create, :show]
  resources :teams, only: [:create, :index, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show", as: :dashboard
  get "/history", to: "contracts#index"

  namespace :admin do
    get "/dashboard", to: "users#show", as: :dashboard
    resources :users, only: [:edit, :update]
    resources :contracts, only: [:show, :index]
    resources :coders, only: [:index, :edit, :update]
  end

  get "/:slug", to: "categories#show", as: :category
end
