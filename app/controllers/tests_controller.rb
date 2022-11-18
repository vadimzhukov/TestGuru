class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Question.all.map(&:test).uniq
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
