require 'octokit'

class IssuesController < ApplicationController
  def index
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    @issues = client.issues("#{params[:user]}/#{params[:repo]}", {state: "open"})
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
    @timeline = client.issue_timeline("#{params[:user]}/#{params[:repo]}", params[:number])
  end

  def preview
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    render html: client.markdown(request.body.string).html_safe
  end

  def comment
    access_token = ENV["GITHUB_TOKEN"]
    client = Octokit::Client.new(access_token: access_token)

    client.add_comment("#{params[:user]}/#{params[:repo]}", params[:number], params[:comment][:body])
  end
end
