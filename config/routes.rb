Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :preferences, only: %i[index create]
  resources :channels do
    resources :messages
  end

  get 'user/:id/message', to: 'users#message', as: 'user_message'
  resources :preferences, only: %i[index create]
  resources :friends, only: %i[index create]


  
  resources :breeds do
    resources :posts do
      resources :comments
    end
  end
  
  delete 'user/:id/unfriend' => 'friends#unfriend', as: 'unfriend'
  post 'user/:id/decline' => 'friends#decline', as: 'decline'
  post 'user/:id/accept' => 'friends#accept', as: 'accept'
  get 'addfriend/:id' => 'friends#add_friend', as: 'add_friend'
  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  get 'user/:id' => 'pages#view_profile', as: 'view_profile'
  get '*path' => 'pages#not_found'
end
