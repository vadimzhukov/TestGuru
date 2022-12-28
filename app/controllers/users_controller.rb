class UsersController < ApplicationController
  before_action :set_user, only: %i[show rewards]

  def show; end

  def rewards
    @badges = @user.badges
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
