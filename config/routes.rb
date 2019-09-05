Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :destroy]

  root to: 'users#index'
end
