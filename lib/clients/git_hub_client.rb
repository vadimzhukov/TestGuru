require 'octokit'
class GitHubClient
  GITHUB_TOKEN = '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'

  def initialize
    @http_client = set_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def set_http_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end
end
