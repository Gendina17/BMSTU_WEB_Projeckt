Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root 'main#index'
  get 'main/index'
  get 'main/profile'
  get 'main/my_profile'
  get '/signin', to: 'session#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'session#destroy'
  get 'session/destroy'
  resources :session, only: %i[new create destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
