class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin?

  def current_user
    User.find_by(username: session[:user_name]) if session[:user_name]
  end

  def logged_out?
    current_user == false
  end

  def admin?
    current_user && current_user.admin?
  end
end
