class AddTweetIdToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :tweet_id, :integer
  end
end
