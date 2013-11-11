class Commit < ActiveRecord::Base
  attr_accessible :author, :authored_date, :comment, :committed_date, :committer, :message, :sha, :sha_short, :repo, :branch, :ticket
end
