Rails.application.routes.draw do
  devise_for :users
  root 'roles#index'
  resources :users
  resources :roles
  resources :items
end
