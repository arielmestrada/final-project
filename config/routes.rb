Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  # devise_scope :user do
  #   get 'users', to: 'devise/session#new'
  # end

  resources :preferences, only: [:index, :create]
  resources :channels do
    resources :messages
  end
  
  get 'user/:id', to: 'users#show', as: 'user_profile'
  get 'user/:id/message', to: 'users#message', as: 'user_message'

  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  
  get '*path' => 'pages#not_found'
end
