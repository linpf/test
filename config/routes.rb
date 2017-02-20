Rails.application.routes.draw do
  root "todo_lists#index"

  resources :todo_lists do

    resources :todo_items
  end


  resources :sessions, only: [:new, :create, :destroy]

  #root to: "todo_lists#index"

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  get "/add" => "todo_lists#new", as: "add"


end
