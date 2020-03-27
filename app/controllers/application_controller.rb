class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?,
                :deny_access

  private

  def deny_access
    cookies[:original_url] = request.url if cookies[:original_url].blank?
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
  end

  def authenticate_user!
    deny_access unless current_user
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
