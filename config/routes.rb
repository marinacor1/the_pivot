Rails.application.routes.draw do
 root "homes#show"
  resources :homes, only: [:show]

  resources :coders, only: [:index]

  resources :categories, only: [:show]

  resources :teams, only: [:create, :index, :destroy]
end
