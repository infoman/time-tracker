class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    user_time_records_path(user)
  end
end
