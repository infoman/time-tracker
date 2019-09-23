# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
