class AddTicketToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :ticket, :int
  end
end
