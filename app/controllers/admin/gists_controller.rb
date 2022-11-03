class Admin::GistsController < Admin::BaseController
  before_action :set_test_passage, only: :create

  def index
    @gists = Gist.all
  end

  def create
    gist_obj = GistQuestionService.new(@test_passage)

    gist = gist_obj.call

    if gist_obj.response_success?
      link = helpers.link_to 'gist', gist.url, target: '_blank'
      flash_options = { notice: "The #{link} was successfuly created." }

    else
      flash_options = { alert: 'Gist was not created, try again later.' }
    end
    redirect_to test_passage_path(@test_passage), flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
