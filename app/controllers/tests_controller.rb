class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show; end

  def create
    @test = Test.new(test_parameters)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_parameters)
      redirect_to tests_path

    else
      render :edit
    end
  end

  def destroy
    redirect_to tests_path if @test.destroy
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def test_parameters
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
