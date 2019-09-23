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

class UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = @users.includes(:profile).order(:id)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # PATCH /users/1/set_role
  def set_role
    if @user == current_user
      redirect_back(fallback_location: :root,
        alert: 'You cannot demote yourself, ask another admin to do so' ) and return
    end

    respond_to do |format|
      if @user.update(role: role_param)
        format.html { redirect_to users_url, notice: "#{@user.display_name} is now #{@user.role}" }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def role_param
      params.require(:user).require(:role)
    end
end
