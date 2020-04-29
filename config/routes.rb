Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/index'
  get 'users/show'
  root to: 'tasks#index'
  resources :tasks
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :index, :show]
end
