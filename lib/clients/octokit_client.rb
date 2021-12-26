require 'octokit'

class OctokitClient

  ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']

  def initialize
    @octokit_client = setup_client
  end

  def create_gists(options)
    @octokit_client.create_gist(options)
  end

  def success?
    @octokit_client.last_response.status == 201
  end

  private

  def setup_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end