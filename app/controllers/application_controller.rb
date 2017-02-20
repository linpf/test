class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :logged_in?, :current_user
  before_action :ensure_login
  protect_from_forgery with: :exception

  protected

  def logged_in? 
    session[:user_id]
  end

  def current_user 
     @current_user ||= User.find(session[:user_id])
  end

  def ensure_login 
     redirect_to login_path unless session[:user_id]
  end

end