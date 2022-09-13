class ApplicationController < ActionController::Base
  before_action :save_initial_path

  before_action :authenticate_user!

  helper_method :current_user

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def save_initial_path
    cookies[:initial_path] ||= request.path
  end
end
