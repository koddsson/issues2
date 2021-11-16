require 'octokit'

class IssuesController < ApplicationController
  def index
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    @issues = client.issues("#{params[:user]}/#{params[:repo]}")

  end

  def show
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    @issue = client.issue(
      "#{params[:user]}/#{params[:repo]}",
      params[:number],
      accept: "application/vnd.github.v3.html+json"
    )
    @comments = client.issue_comments(
      "#{params[:user]}/#{params[:repo]}",
      params[:number],
      accept: "application/vnd.github.v3.html+json"
    )
  end
end
