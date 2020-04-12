# frozen_string_literal: true

class GitHubClient
  ACCESS_TOKEN = '2d7d4b0bcfb33b7d0008a2910a784622b386cc8a'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
