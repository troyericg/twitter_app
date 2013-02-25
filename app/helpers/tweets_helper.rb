module TweetsHelper


	def callTwitter(user_or_id)
		userURL = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
		idURL = "https://api.twitter.com/1/statuses/show.json?id="
		user = user_or_id

		if user[0,1].match(/[0-9]/.to_s)
			twitter_url = idURL + user
			results = JSON.parse(open(twitter_url).read)

			@tweet_result = {
				'tweet_text' => results["text"],
				'retweet_count' => results["retweet_count"],
				'screen_name' => results["user"]["screen_name"],
				'real_name' => results["user"]["name"],
				'num_statuses' => results["user"]["statuses_count"],
				'num_following' => results["user"]["friends_count"],
				'num_followers' => results["user"]["followers_count"],
				'img_url' => results["user"]["profile_image_url"].gsub!("_normal","")
			}
			return @tweet_result

		elsif !user[0,1].match(/[0-9]/.to_s)
			twitter_url = userURL + user
			results = JSON.parse(open(twitter_url).read)

			@tweet_result = {
				'screen_name' => results[0]["user"]["screen_name"],
				'real_name' => results[0]["user"]["name"],
				'num_statuses' => results[0]["user"]["statuses_count"],
				'num_following' => results[0]["user"]["friends_count"],
				'num_followers' => results[0]["user"]["followers_count"],
				'img_url' => results[0]["user"]["profile_image_url"].gsub!("_normal","")
			}
			return @tweet_result
		end
	end


end
