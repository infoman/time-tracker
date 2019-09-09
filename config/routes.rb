Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    resource :profile
  end

  root to: 'users#index'
end
