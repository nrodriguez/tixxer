class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_git, :get_tracker

  def new_tracker(tracker)
  	case tracker
  	when "unfuddle"
  		return Trackers::UnfuddleTracker.new(Figaro.env.current_project_id)
  	else
  		return ""
  	end
  end

  def get_git
  	@git = Git.open("git_dir", :log => Logger.new(STDOUT))
  end

  def get_tracker
		@tracker = new_tracker(Figaro.env.current_tracker)
	end
end
