class CommitsController < ApplicationController
	def index
		@branches = @git.branches.local.to_a
		@commits = params["commits"].present? ? params["commits"].collect{|x| Commit.find(x)} : Commit.where(branch: @git.branch.to_s.capitalize)
	end

	def show
		@commit = Commit.find(params[:id])
		@related_commits = Commit.where("(ticket = ?) && (id <> ?)", @commit.ticket, @commit.id)
		
		@ticket_info = @tracker.get_ticket(@commit.ticket)
	end

	def change_branch
		@git.checkout(params[:current][:branch])
		@commits = Commit.where(branch: params[:current][:branch])
		redirect_to commits_path(commits: @commits.collect{|x| x.id})
	end
end
