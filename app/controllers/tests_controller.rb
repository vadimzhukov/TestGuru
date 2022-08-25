class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
    redirect_to test_questions_path(@test)
  end

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
    if @test.destroy
      redirect_to tests_path
    else
      render plain: "При удалении возникла ошибка"
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_parameters
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
