Rails.application.routes.draw do
  resources :articles
  resources :users

  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'

  get "/me", to: "users#show"

end
