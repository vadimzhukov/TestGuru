class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[show edit update destroy]
  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save!
      redirect_to admin_badge_path(@badge), notice: t('.success_create')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success_update')
    else
      render :edit, alert: t('.failed_update')
    end
  end

  def destroy
    redirect_to admin_badges_path if @badge.destroy
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :description)
  end
end
