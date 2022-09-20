class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    if resource.admin?
      flash[:welcome] = "Привет, #{current_user.name} #{current_user.last_name}!"
      admin_tests_path
    else
      root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name])
  end
end
