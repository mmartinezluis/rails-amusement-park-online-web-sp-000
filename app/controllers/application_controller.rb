class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :require_login
  #skip_before_action :require_login, only: [:new]
  helper_method :current_user
  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to '/' unless session[:user_id]
  end

  def verify_user
    current_user.id == params[:id]
  end

end
