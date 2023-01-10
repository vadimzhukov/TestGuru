class BadgesController < ApplicationController
  
  before_action :set_test_passage, only: %i[add]

  def index
    @badges = Badge.all
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
