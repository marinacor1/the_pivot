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

  get    "/:city/homes/:id",       to: "homes#show",        as: :city_home
  get    "/:city/homes/:id/edit",  to: "homes#edit",        as: :edit_home
  put    "/:city/homes/:id",       to: "homes#update"
  patch  "/:city/homes/:id",       to: "homes#update"
  get    "/:city",                 to: "cities#show",       as: :city
end
