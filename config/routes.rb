Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances',    to: 'attendances#index'
  root   'sessions#new'
  get    '/menu',    to: 'interface#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'interface/send_data'
  get 'interface/data'
  get 'interface/app'
  get 'interface/cable'
  get 'interface/attendances'

  get 'interface/scan'

  post   '/accounts/create',   to: 'accounts#create'

  mount ActionCable.server => '/cable'
end
