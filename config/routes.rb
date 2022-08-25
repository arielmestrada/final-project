Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :preferences, only: [:index, :create]

  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  get '*path' => 'pages#not_found'
end
