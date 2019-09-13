class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_profile, only: [:edit, :update]

  # GET /profiles/1/edit
  def edit
    authorize! :update, @profile
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    authorize! :update, @profile

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to user_path(@profile.user_id), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by_user_id(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:full_name, :expected_hours)
    end
end
