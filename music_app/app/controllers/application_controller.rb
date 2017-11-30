class ApplicationController < ActionController::Base
  helper_method :logged_in?
  protect_from_forgery with: :exception

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    return true if current_user
    nil
  end

end
