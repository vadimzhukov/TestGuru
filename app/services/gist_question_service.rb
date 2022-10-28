class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    gist_description = I18n.t('test_passages.gist_description', test_title: @test.title)

    { description: gist_description,
      public: false,
      files: {
        "TestGuru_question.txt": { content: gist_content }
      } }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
