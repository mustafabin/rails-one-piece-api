Rails.application.routes.draw do
  resources :users
  resources :devil_fruits
  resources :sessions, only: [:create]
  get '/testing', to: 'devil_fruits#testing'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  get '/profile', to: 'users#profile'

end
