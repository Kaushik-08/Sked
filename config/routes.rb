Rails.application.routes.draw do
  resources :posts
  get 'default_images/new'
  root "homes#index"
  get 'boards/new'
  get 'homes/main'
  get 'boards/userbord'
  resources :default_images
  match '/boards', to: "boards#create", via: :post
# resources :boards
  match '/boards/userbord', to: "boards#create", via: :post
  get '/userbord', to: "boards#userbord"
  # get 'users/new'
  # get 'homes/login'
  # get 'homes/signup'
  # match '/signup', :to => 'homes#main', :via => :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  # resources :boards
  get "/users/new", to: "users#create"
  match "/users", :to => "users#create", :via => :post
  get "signin", to: "sessions#new", as: :new_sessions

  get "/background/:id", to: "boards#background", as: :background
  post "/background", to: "boards#new_background"

  match "/new_task/:id",to: "boards#new_task", via: :post
  post "signin", to: "sessions#create", as: :sessions
  delete "signout", to: "sessions#destroy", as: :destroy_session 

  Rails.application.routes.draw do
    resources :posts do
      member do
        delete :delete_file
      end
    end
  end


end
