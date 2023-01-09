class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.current_question
      render :show
    else
      @test_passage.set_final_status
      redirect_to add_badges_path(id: @test_passage)
    end
  end

  def result
    @badges = current_user.badges.select{|b| UserBadge.where("test_passage_id = ?", @test_passage.id).pluck('badge_id').include?(b.id)}
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
