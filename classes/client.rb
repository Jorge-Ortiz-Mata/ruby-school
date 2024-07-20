# frozen_string_literal: false

require 'github_client'

# It models the InfoGithubClient class
class Client
  attr_reader :auth_token

  def initialize(auth_token)
    @auth_token = auth_token
  end

  def user_info(username)
    github_client = GithubClient.new(auth_token)
    github_client.user_info(username)
  end

  def user_repositories(username)
    github_client = GithubClient.new(auth_token)
    github_client.user_repositories(username)
  end

  def repository_info(username, repository)
    github_client = GithubClient.new(auth_token)
    github_client.repository_info(username, repository)
  end
end
