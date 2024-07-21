# frozen_string_literal: false

require 'faraday'

# It models the GithubClient class
class GithubClient
  class Error < StandardError; end
  class NotFoundError < Error; end
  class UnauthorizedError < Error; end

  def initialize(token)
    @token = token
    @base_url = 'https://api.github.com/'
    @conn = connection(@base_url, {}, set_headers)
  end

  def user_info(username)
    res = @conn.get("/users/#{username}")
    set_response(res)
  end

  def user_repositories(username)
    res = @conn.get("/users/#{username}/repos")
    set_response(res)
  end

  def repository_info(username, repository)
    res = @conn.get("/repos/#{username}/#{repository}")
    set_response(res)
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

  def set_response(res)
    case res.status
    when 200
      JSON.parse(res.body)
    when 401
      raise UnauthorizedError, JSON.parse(res.body)['message']
    when 404
      raise NotFoundError, JSON.parse(res.body)['message']
    end
  end
end
