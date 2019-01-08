class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :log_in, :logged_in?
  add_flash_types :alert

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  private

  def authenticate_user!
    unless current_user
      store_location
      redirect_to login_path
    end
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
