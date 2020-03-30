class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :deny_access

  private

  def deny_access
    cookies[:original_url] = request.url if cookies[:original_url].blank?
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
  end

end
