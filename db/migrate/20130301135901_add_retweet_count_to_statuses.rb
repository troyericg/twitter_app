class AddRetweetCountToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :num_retweets, :integer
  end
end
