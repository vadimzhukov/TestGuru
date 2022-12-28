class BadgesController < ApplicationController
  
  before_action :set_test_passage, only: %i[add]

  def index
    @badges = Badge.all
  end
  
  def add
    service = RewardService.new(@test_passage)

    badges = service.call

    flash_options = { notice: t('.badges_created') } if badges

    redirect_to result_test_passage_path(@test_passage)
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
