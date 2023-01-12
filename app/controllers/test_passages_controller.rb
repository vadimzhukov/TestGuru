class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if !@test_passage.current_question || @test_question.expired?
      @test_passage.set_final_status
      
      service = RewardService.new(@test_passage)
      badges = service.call

      flash_options = { notice: t('.badges_created') } if badges

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
    @badges = current_user.badges.select{|b| UserBadge.where(test_passage_id: @test_passage.id).pluck('badge_id').include?(b.id)}
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
