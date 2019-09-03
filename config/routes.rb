Rails.application.routes.draw do
  resources :users, except: [:new, :create]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
