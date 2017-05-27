Rails.application.routes.draw do

  devise_for :users

  root 'pages#standby'

  get 'standby', to: 'pages#standby'

  get 'thesis/:id', to: 'pages#thesis'

  get 'dashboard', to: 'pages#dashboard'

  post 'pages/create'

  mount ActionCable.server => '/cable'

end
