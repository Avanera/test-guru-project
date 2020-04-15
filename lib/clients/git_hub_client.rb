# frozen_string_literal: true

class GitHubClient
  GIST_ACCESS_TOKEN = ENV['GIST_ACCESS_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def last_response
    @http_client.last_response
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: GIST_ACCESS_TOKEN)
  end
end
