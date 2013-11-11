module Trackers
  class UnfuddleTracker    
    require 'json'
    require 'rest_client'

    def initialize(project)
      @user_name = Figaro.env.unfuddle_user
      @password = Figaro.env.unfuddle_password
      @account_name = Figaro.env.unfuddle_account
      @url = "https://#{@user_name}:#{@password}@#{@account_name}.unfuddle.com/api/v1/projects/#{project}"
    end

    def get_tickets
      response = RestClient.get "#{@url}/tickets", {:accept => :json}
      JSON.parse(response)
    end

    def get_ticket(ticket_number)
      response = RestClient.get "#{@url}/tickets/by_number/#{ticket_number}", {:accept => :json}
      JSON.parse(response)
    end
  end
end