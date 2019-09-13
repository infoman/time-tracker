Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    member do
      patch :set_role, as: :rerole
    end

    resource :profile, only: [:edit, :update]
    resources :time_records do
      get ':date', action: :new, as: :dated, on: :new
    end
  end

  root to: 'welcome#index'
end
