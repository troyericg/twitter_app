class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :screen_name
      t.string :real_name
      t.integer :num_statuses
      t.integer :num_following
      t.integer :num_followers
      t.string :img_url
      t.text :tweet_body

      t.timestamps
    end
  end
end
