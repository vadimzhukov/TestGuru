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

    link = helpers.link_to 'gist', result[:html_url], target: '_blank'
    gist_url = result[:html_url]

    @gist = @test_passage.gists.new({ url: gist_url, gist_hash: result[:id],
                                      question: @test_passage.current_question })

    flash_options = if @gist.save
                      { notice: "The #{link} was successfuly created" }
                    else
                      { alert: 'Gist was not created' }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
