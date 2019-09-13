Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    resource :profile, only: [:edit, :update]
    resources :time_records do
      get ':date', action: :new, as: :dated, on: :new
      collection do
      end
    end
  end

  root to: 'users#index'
end
