class Admin::GistsController < Admin::BaseController
  before_action :set_test_passage, only: :create

  def index
    @gists = Gist.all
  end

  def create
    new_gist = GistQuestionService.new(@test_passage)
    gist = new_gist.save
    if gist.persisted?
      link = helpers.link_to 'gist', gist.url, target: '_blank'
      flash_options = { notice: "The #{link} was successfuly created" }
      redirect_to test_passage_path(@test_passage), flash_options
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
