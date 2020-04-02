class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :deny_access

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def deny_access
    cookies[:original_url] = request.url if cookies[:original_url].blank?
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
  end

end
