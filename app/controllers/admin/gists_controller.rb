class Admin::GistsController < Admin::BaseController
  before_action :set_test_passage, only: :create

  def index
    @gists = Gist.all
  end

  def create
    service = GistQuestionService.new(@test_passage)

    gist = service.call

    if service.response_success?
      link = helpers.link_to 'gist', gist.url, target: '_blank'
      flash_options = { notice: t('.gist_created', gist_link: link) }
    else
      flash_options = { alert: t('.gist_failed') }
    end
    redirect_to test_passage_path(@test_passage), flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
