class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_passage, only: %i[show update result gist]

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

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
                      { notice: "Gist #{JSON.parse(result.to_hash[:body])['html_url']} was successfuly created" }
                    else
                      { alert: "Gist was not created, the reason #{result.reason_phrase}" }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
