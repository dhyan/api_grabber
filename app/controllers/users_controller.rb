class UsersController < ApplicationController
  def grab_api_data
    github
    twitter
    ruby_gems
    render "grab_api_data"
  end

  private

  def twitter
    @twitter = $client.search("from:#{params[:username]}", result_type: "recent").take(10)
  end

  def github
    begin
      github = Github.new :oauth_token => GITHUB_TOKEN
      response = Typhoeus.get("https://api.github.com/users/#{params[:username]}")
      @github_user = JSON.parse(response.body)
      @github_repos = github.repos.list(user: params[:username]).map(&:full_name)
    rescue Exception => e
      @github_user = ""
      @github_repos = []
    end
  end

  def ruby_gems
    @gems = begin
      Gems.gems(params[:username]).map{|g| g["name"]}
    rescue Exception => e
      []
    end
  end
end
