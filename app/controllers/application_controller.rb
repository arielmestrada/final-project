class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    if exception.message == 'Banned'
      redirect_to banned_path
    else
      redirect_to root_path, alert: exception.message
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :error, :warning, :success

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name mobile_number birthdate sex])
  end

  def after_sign_in_path_for(_resource)
    # cookies[:uid] = current_user&.id || 'guest'
    login_count = view_context.count_user_login
    if login_count > 1
      root_path
    else
      preferences_path
    end
  end
end
