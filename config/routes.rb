Rails.application.routes.draw do
  root   "welcome#show"

  namespace :api do
    namespace :v1 do
      post '/carts',        to: 'carts#create'
    end
  end

  get    "/login",                 to: "sessions#new"
  post   "/login",                 to: "sessions#create"
  delete "/logout",                to: "sessions#destroy"

  get     "/users/new",            to: "users#new",             as: :new_user
  post    "/users",                to: "users#create",          as: :users
  patch   "/users",                to: "users#create"
  delete "/users/:id",             to: "users#destroy"

  resources :users, only: [:edit, :update]

  get    "/dashboard",             to: "users#show",            as: :dashboard

  get    "/cart",                  to: 'carts#show',            as: :cart
  post   '/cart',                  to: 'carts#destroy'
  # delete '/cart',                  to: 'carts#destroy'

  get    '/trips',                 to: 'trips#show'
  post   '/trips',                 to: 'trips#create'

  get    "/users",                 to: "users#index",        as: :homes

  # namespace :api do
  #   namespace :v1 do
  #     post '/carts',        to: 'carts#create'
  #   end
  # end

  # resources :reservations do
  #   collection do
  #     get 'pending'
  #   end
  # end
  get "/pendinghomes",             to: "homes#index",        as: :pending_homes
  post "/pendinghomes",            to: "user#show"
  get   "/homes/new",              to: "homes#new",         as: :new_home
  post   "/homes",                 to: "homes#create"
  get    "/:city/homes/:id",       to: "homes#show",        as: :city_home
  get    "/:city/homes/:id/edit",  to: "homes#edit",        as: :edit_home
  put    "/:city/homes/:id",       to: "homes#update"
  patch  "/:city/homes/:id",       to: "homes#update"
  get    "/:city",                 to: "cities#show",       as: :city

  get "/reviews/new", to: "reviews#new", as: :new_review
  post "/reviews/new", to: "reviews#create"
end
