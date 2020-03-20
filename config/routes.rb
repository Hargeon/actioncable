Rails.application.routes.draw do
  root 'users#index'

  resources :messages, only: %i[create]
  resources :sessions, only: %i[new create destroy]
  resources :users
end
