Rails.application.routes.draw do

  devise_for :users

  root 'pages#root'

  scope 'users/:user_id' do

    get 'standby', to: 'pages#standby', as: 'standby'

    get 'thesis/:id', to: 'pages#thesis'

  end

  get 'dashboard', to: 'pages#dashboard'

  post 'pages/create'

  get 'export', to: 'pages#export'

  mount ActionCable.server => '/cable'

end
