require 'octokit'

class IssuesController < ApplicationController
  def index
    query = "#{params[:query] || ''} is:issue is:open repo:#{params[:user]}/#{params[:repo]}"
    results = client.search_issues(query, accept: 'application/vnd.github.v3+json', page: params[:page])
    @total_count = results.total_count
    @issues = results.items
  end

  def show
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
    render html: client.markdown(request.body.string).html_safe
  end

  def comment
    client.add_comment("#{params[:user]}/#{params[:repo]}", params[:number], params[:comment][:body])
  end

  private 

  def client
    @client ||= Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end
end
