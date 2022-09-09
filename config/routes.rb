Rails.application.routes.draw do
  resources :users
  resources :devil_fruits

  get '/testing', to: 'devil_fruits#testing'

end
