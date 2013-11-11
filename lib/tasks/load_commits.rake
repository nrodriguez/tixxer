require 'debugger'
namespace :load_commits do
  desc "Add commits from the git repo to the databas"
  task :add_commits_to_db => :environment do 	
		git = Git.open("git_dir", :log => Logger.new(STDOUT))
		branches = git.branches.local.to_a
		branches.each do |branch|
			git.checkout(branch)
			repo = Grit::Repo.new("git_dir")
			
			repo.commits("#{branch.to_s}").each do |commit|
				new_commit = Commit.find_or_create_by_sha(
					sha: commit.id,
					committer: commit.committer.name,
					comment: "",
					author: commit.author.name,
					authored_date: commit.authored_date,
					committed_date: commit.committed_date,
					message: commit.message,
					sha_short: commit.id_abbrev,
					repo: "",
					ticket: commit.message.match(/#(\d+)/) ? commit.message.match(/#(\d+)/).captures.first : "",
					branch: branch.to_s
				)
				new_commit.save
			end
		end
  end

end
