Rails.application.routes.draw do
  root   'sessions#new'
  get    '/menu',    to: 'interface#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'interface/send_data'
  get 'interface/data'
  get 'interface/app'
  get 'interface/cable'
  get 'interface/scan'

  resources :accounts

  mount ActionCable.server => '/cable'
end
