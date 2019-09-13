class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    user_time_records_path(user)
  end

  rescue_from CanCan::AccessDenied do |e|
    redirect_back fallback_location: :root, alert: e.message
  end
end
