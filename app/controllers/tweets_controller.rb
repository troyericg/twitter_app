class TweetsController < ApplicationController
  def index

  	def callTwitter(user_or_id)
		userURL = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
		idURL = "https://api.twitter.com/1/statuses/show.json?id="
		user_name = user_or_id

		if user_name[0,1].class == "integer"
			twitter_url = idURL + user_name
		elsif user_name[0,1].class != "integer"
			twitter_url = userURL + user_name
			results = JSON.parse(open(twitter_url).read)

			@tweet_result = {
				'screen_name' => results[0]["user"]["screen_name"],
				'real_name' => results[0]["user"]["name"],
				'num_statuses' => results[0]["user"]["statuses_count"],
				'num_following' => results[0]["user"]["friends_count"],
				'num_followers' => results[0]["user"]["followers_count"],
				'img_url' => results[0]["user"]["profile_image_url"].gsub!("_normal",""),
			}
		end
  	end

  end
end
