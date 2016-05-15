Rails.application.routes.draw do
  root   "welcome#show"
  #
  # get    "/homes/:id",             to: "homes#show"
  # get    "/coders/:id",            to: "coders#show",           as: :coder
  # get    "/coders",                to: "coders#index",          as: :coders

  get    "/users/new",             to: 'users#new',             as: :new_user

  # resources :reservations, only: [:create]

  namespace :api do
    namespace :v1 do
      post "/reservations", to: 'reservations#create'
      post "/carts",        to: 'carts#create'
    end
  end

  # post    "/reservations",          to: '/reservations#create', as: :reservations

  # post   "/users",                 to: "users#create",          as: :users
  # post   "/contracts",             to: "contracts#create",      as: :contracts
  # get    "/contract/:id",          to: "contracts#show",        as: :contract
  # get    "/teams",                 to: "teams#index",           as: :teams
  # post   "/teams",                 to: "teams#create"
  # delete "/teams/:id",             to: "teams#destroy",         as: :team
  #
  # get    "/admin/dashboard",       to: "admin/users#show",      as: :admin_dashboard
  # get    "/admin/users/:id/edit",  to: "admin/users#edit",      as: :edit_admin_user
  # patch  "/admin/users/:id",       to: "admin/users#update",    as: :admin_user
  # get    "/admin/contracts/:id",   to: "admin/contracts#show",  as: :admin_contract
  # get    "/admin/contracts",       to: "admin/contracts#index", as: :admin_contracts
  # get    "/admin/coders",          to: "admin/coders#index",    as: :admin_coders
  # get    "/admin/coders/:id/edit", to: "admin/coders#edit",     as: :edit_admin_coder
  # patch  "/admin/coders/:id",      to: "admin/coders#update",   as: :admin_coder
  #
  get    "/login",                 to: "sessions#new"
  post   "/login",                 to: "sessions#create"
  delete "/logout",                to: "sessions#destroy"
  # get    "/dashboard",             to: "users#show",            as: :dashboard
  # get    "/history",               to: "contracts#index"

  get    "/cart",                  to: 'carts#show',            as: :cart
  post   "/cart",                  to: 'carts#create'

  get    "/:city/homes/:id",       to: "homes#show",        as: :home
  get    "/:city",                 to: "cities#show",       as: :city
end
