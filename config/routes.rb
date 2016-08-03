Rails.application.routes.draw do
  root to: 'home#index'
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :items, only: [:new, :create, :edit, :update]
  end
  resources :cart_items, only: [:create, :update, :destroy]
  resources :cart, only: [:index]
  resources :items, only: [:index, :show] do
    get 'unavailable', on: :collection
  end
  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :create, :show]
  resources :charges
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/:title', to: 'categories#show', as: :category
  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
end
