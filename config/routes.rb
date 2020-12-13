# frozen_string_literal: true

Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root 'main#index'
  get 'main/index'
  get 'main/edit'
  get 'main/destroy'
  get 'main/create'
  post 'main/create'
  patch 'main/create'
  get 'profile/:id', to: 'main#profile'
  get 'likers/:id', to: 'main#likers'
  get 'main/my_profile'
  get '/signin', to: 'session#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'session#destroy'
  get 'session/destroy'
  get 'love', to: 'main#love_users'
  get 'users/in'
  get 'main/add'
  get 'main/delete'
  get 'main/delete_card'

  resources :session, only: %i[new create destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
