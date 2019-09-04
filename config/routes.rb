Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]

  root to: 'users#index'
end
