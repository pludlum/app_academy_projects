class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by('session_token = ?', session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    user = current_user
    user.reset_session_token!
    session[:session_token] = nil
  end
end
