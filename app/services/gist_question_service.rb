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
    gist = structured_gist

    stored_gist = @test_passage.gists.new({ url: gist.url, gist_hash: gist.id,
                                            question: @question })
    gist if stored_gist.save
  end

  def response_success?
    @client.last_response.status.to_s.match(/^20\d$/)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def create_gist
    @client.create_gist(gist_params)
  end

  def structured_gist
    Struct.new('StructuredGist', :id, :url)
    gist = create_gist
    Struct::StructuredGist.new(gist[:id], gist[:html_url])
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
