class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :message
      t.string :comment
      t.string :author
      t.datetime :authored_date
      t.string :committer
      t.datetime :committed_date
      t.string :sha_short

      t.timestamps
    end
  end
end
