require 'octokit'
require 'json'

class IssuesController < ApplicationController
  def index
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    @issues = client.issues("#{params[:user]}/#{params[:repo]}")
  end
end
