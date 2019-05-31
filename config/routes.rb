Rails.application.routes.draw do
  post 'interface/send_data'
  get 'interface/data'

  get 'interface/app'
  get 'interface/cable'

  get 'interface/scan'

  mount ActionCable.server => '/cable'
end
