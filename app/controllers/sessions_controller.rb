class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:initial_path] || root_path
      cookies[:initial_path] = nil
    else
      flash.now[:alert] = 'Log in не удался'
      render :new
    end
  end

  def destroy
    user = User.find(session[:user_id])
    session[:user_id] = nil
    flash.now[:notification] = 'Выполнен log out'
    redirect_to root_path
  end
end
