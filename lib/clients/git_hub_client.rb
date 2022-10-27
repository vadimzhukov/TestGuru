class GitHubClient
  GITHUB_API_ENDPOINT = 'https://api.github.com'
  GITHUB_TOKEN = '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'

  def initialize
    @http_client = set_http_connection
  end

  def create_gist(params)
    @http_client.post('/gists') do |request|
      request.headers['Accept'] = 'application/vnd.github+json'
      request.headers['Authorization'] = "Bearer #{GITHUB_TOKEN}"
      request.body = params.to_json
    end
  end

  private

  def set_http_connection
    Faraday.new(url: GITHUB_API_ENDPOINT)
  end
end
