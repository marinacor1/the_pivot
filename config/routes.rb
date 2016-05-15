Rails.application.routes.draw do
  root   "welcome#show"

  # get    "/homes/:id",             to: "homes#show"
  # get    "/coders/:id",            to: "coders#show",           as: :coder
  # get    "/coders",                to: "coders#index",          as: :coders

  get    "/users/new",             to: 'users#new',             as: :new_user

  # resources :reservations, only: [:create]

  namespace :api do
    namespace :v1 do
      # post '/reservations', to: 'reservations#create'
      post '/carts',        to: 'carts#create'
    end
  end

  resources :reservations do
    collection do
      get 'pending'
    end
  end


  get    "/login",                 to: "sessions#new"
  post   "/login",                 to: "sessions#create"
  delete "/logout",                to: "sessions#destroy"

  get    "/cart",                  to: 'carts#show',            as: :cart
  post   '/cart',                  to: 'carts#destroy'
  # delete '/cart',                  to: 'carts#destroy'

  get    '/trips',                 to: 'trips#show'
  post   '/trips',                 to: 'trips#create'


  get    "/:city/homes/:id",       to: "homes#show",        as: :home
  get    "/:city",                 to: "cities#show",       as: :city
end
