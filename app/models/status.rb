class Status < ActiveRecord::Base
	attr_accessible :img_url, :num_followers, :num_following, :num_statuses, :real_name, :screen_name, :tweet_body


end

