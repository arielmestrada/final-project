Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :preferences, only: %i[index create]

  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  get 'user/:id' => 'pages#view_profile', as: 'view_profile'
  get '*path' => 'pages#not_found'
end
