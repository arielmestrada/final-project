class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_user
  add_flash_types :info, :error, :warning, :success

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name mobile_number birthdate sex])
  end

  def after_sign_in_path_for(_resource)
    login_count = view_context.count_user_login
    if login_count > 1
      dashboard_path
    else
      preferences_path
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def new_user
    if User.all.empty?
      @user = User.new
      @user.email = 'test@email.com'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.first_name = 'Test'
      @user.last_name = 'TestAgain'
      @user.birthdate = '2002-01-01'
      @user.sex = 'male'
      @user.skip_confirmation!
      @user.save
      redirect_to root_path
    end
  end
end
