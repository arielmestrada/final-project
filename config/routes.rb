Rails.application.routes.draw do
  root 'pages#dashboard'
  devise_for :users

  resources :users, only: %i[index update]

  resources :preferences, only: %i[index create]
  resources :channels do
    resources :messages
  end

  get 'user/:id/message', to: 'users#message', as: 'user_message'
  resources :preferences, only: %i[index create]
  delete '/remove_preference' => 'preferences#destroy', as: 'remove_preference'
  resources :friends, only: %i[index create]

  resources :breeds do
    resources :posts do
      resources :comments
    end
  end
  
  # errors
  patch 'preferences/:breed_name' => 'breeds#add_preferred_breed', as: 'add_preferred'
  delete 'user/:id/unfriend' => 'friends#unfriend', as: 'unfriend'
  post 'user/:id/decline' => 'friends#decline', as: 'decline'
  post 'user/:id/accept' => 'friends#accept', as: 'accept'
  post 'user/:id/addfriend' => 'friends#add_friend', as: 'add_friend'
  # friends
  get 'user/friends' => 'pages#view_friends', as: 'view_friends'
  post 'user/friends' => 'pages#search_friends', as: 'view_friends_post'
  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  get 'user/:id' => 'pages#view_profile', as: 'view_profile'
  get 'banned' => 'errors#banned', as: 'banned'
  get '*path' => 'errors#not_found'
end
