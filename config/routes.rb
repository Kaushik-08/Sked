# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get 'default_images/new'
  root 'homes#index'
  get 'boards/new'
  get 'homes/main'
  get 'boards/userbord'
  get 'homes/views'
  get 'homes/index'
  resources :default_images
  match '/boards', to: 'boards#create', via: :post
  # resources :boards
  match '/boards/userbord', to: 'boards#create', via: :post
  get '/userbord', to: 'boards#userbord'
  # get 'users/new'
  # get 'homes/login'
  # get 'homes/signup'
  # match '/signup', :to => 'homes#main', :via => :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  # resources :boards
  get '/users/new', to: 'users#create'
  match '/users', to: 'users#create', via: :post
  

  get '/background/:id', to: 'boards#background', as: :background
  post '/background', to: 'boards#new_background'

  match '/new_task/:id', to: 'boards#new_task', via: :post

  get '/signin', to: 'sessions#new', as: :new_sessions
  post '/signin', to: 'sessions#create', as: :sessions
  get '/signout', to: 'sessions#destroy', as: :destroy_session

  get 'search', to: 'homes#search'

  Rails.application.routes.draw do
    resources :posts do
      member do
        delete :delete_file
      end
    end
  end
end
