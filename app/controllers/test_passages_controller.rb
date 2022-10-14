class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.current_question
      render :show
    else
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
