class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include SessionsHelper
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :authorize_user

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authorize_user!
    redirect_to login_path unless current_user.present?
  end

end
