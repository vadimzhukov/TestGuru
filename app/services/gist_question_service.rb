require 'octokit'

class GistQuestionService
  include ActionView::Helpers::UrlHelper

  def initialize(test_passage, client = default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @client = client
  end

  def call
    result = create_structured_gist

    gist = @test_passage.gists.new({ url: result.url, gist_hash: result.id,
                                     question: @question })
  if gist.save
    result
  else
    nil
  end
  

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def create_structured_gist
    Struct.new('StructuredGist', :id, :url, :success?)
    gist = @client.create_gist(gist_params)
    response_status_success = (@client.last_response.status.to_s =~ /^20\d$/)

    Struct::StructuredGist.new(gist[:id], gist[:html_url], response_status_success)
  end

  def gist_params
    gist_description = I18n.t('test_passages.gist_description', test_title: @test.title)

    { description: gist_description,
      public: false,
      files: {
        "TestGuru_question.txt": { content: gist_content }
      } }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
