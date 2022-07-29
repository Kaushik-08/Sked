Rails.application.routes.draw do
  get 'boards/new'
  get 'homes/index'
  get 'homes/main'
  match '/boards', to: "boards#create", via: :post
  # match '/boards/userbord', to: "boards#create", via: :post
  get '/userbord', to: "boards#userbord"
  # get 'users/new'
  # get 'homes/login'
  # get 'homes/signup'
  # match '/signup', :to => 'homes#main', :via => :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  resources :users
  # resources :boards
  get "/users/new", to: "users#create"
  match "/users", :to => "users#create", :via => :post
  get "signin", to: "sessions#new", as: :new_sessions
  post "signin", to: "sessions#create", as: :sessions
  delete "signout", to: "sessions#destroy", as: :destroy_session 
end
