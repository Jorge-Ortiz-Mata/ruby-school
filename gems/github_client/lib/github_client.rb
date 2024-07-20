# frozen_string_literal: false

require 'faraday'

# It models the GithubClient class
class GithubClient
  def initialize(token)
    @token = token
    @base_url = 'https://api.github.com/'
    @conn = connection(@base_url, {}, set_headers)
  end

  def user_info(username)
    res = @conn.get("/users/#{username}")

    JSON.parse(res.body)
  end

  def user_repositories(username)
    res = @conn.get("/users/#{username}/repos")

    JSON.parse(res.body)
  end

  def repository_info(username, repository)
    res = @conn.get("/repos/#{username}/#{repository}")

    JSON.parse(res.body)
  end

  private
  
  def connection(base_url, params, headers)
    @connection ||= Faraday.new(
      url: base_url,
      params: params,
      headers: headers
    )
  end

  def set_headers
    { 
      'Accept': 'application/vnd.github+json',
      'Authorization': "Bearer #{@token}",
      'X-GitHub-Api-Version': '2022-11-28'
    }
  end
end
