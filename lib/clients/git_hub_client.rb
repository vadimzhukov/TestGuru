require 'octokit'
class GitHubClient
  def initialize
    @http_client = set_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def set_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end
