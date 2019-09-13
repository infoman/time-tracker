class UsersController < ApplicationController
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
    logger.debug @user.inspect
    logger.debug current_user.inspect
    logger.debug @user == current_user

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
