require 'rubygems'
require 'json'
require 'open-uri'
require 'rest-client'


namespace :tweet do
	desc "testing tweets"
	task :test => :environment do
		# userURL = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
		# idURL = "https://api.twitter.com/1/statuses/show.json?id="
		user_id = "301524565425795072"
		user_name = "JSilz911"
		# twitter_user_url = userURL + user_name
		# twitter_id_url = idURL + user_id
		



		def callTwitter(user_or_id)
			userURL = "http://api.twitter.com/1/statuses/user_timeline.json?count=1&screen_name="
			idURL = "https://api.twitter.com/1/statuses/show.json?id="
			user = user_or_id

			if user[0,1].match(/[0-9]/.to_s)
				twitter_url = idURL + user
				results = JSON.parse(open(twitter_url).read)

				@tweet_result = {
					'tweet_id' => user.to_i,
					'tweet_body' => results["text"],
					'num_retweets' => results["retweet_count"],
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
					'tweet_id' => results[0]["id"],
					'tweet_body' => results[0]["text"],
					'retweet_count' => results[0]["retweet_count"],
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


		tweet_obj = callTwitter(user_name)
		puts 
		puts "Screen Name:"
		puts tweet_obj['screen_name']
		puts "Real Name:"
		puts tweet_obj['real_name']
		puts "Tweet ID:"
		puts tweet_obj['tweet_id']
		puts "Total Tweets:"
		puts tweet_obj['num_statuses']
		puts "Following:"
		puts tweet_obj['num_following']
		puts "Followers:"
		puts tweet_obj['num_followers']

		puts "---------------"

		puts "Profile Image:"
		puts tweet_obj['img_url']
		puts "Text:"
		puts tweet_obj['tweet_body']
		puts "Number of Retweets:"
		puts tweet_obj['retweet_count']


		# puts Float(user_id[0,1])
		# puts Float(user_id[0,1]).class == Float
		# puts Float(user_name[0,1])

		# if user_id[0,1].match(/[0-9]/.to_s)
		# 	puts "This matches a number"
		# elsif !user_id[0,1].match(/[0-9]/.to_s)
		# 	puts "This does NOT match a number"
		# end

		
		
		### FOR ID TESTING
		# puts results["user"]["screen_name"]
		# puts results["user"]["name"]
		# puts results["text"]
		# puts results["user"]["statuses_count"]
		# puts results["user"]["friends_count"]
		# puts results["user"]["followers_count"]
		# puts results["user"]["profile_image_url"].gsub!("_normal","")


		### FOR USERNAME TESTING
		# puts results[0]["user"]["screen_name"]
		# puts results[0]["user"]["name"]

		# puts results[0]["user"]["statuses_count"]
		# puts results[0]["user"]["friends_count"]
		# puts results[0]["user"]["followers_count"]

		# puts results[0]["user"]["profile_image_url"].gsub!("_normal","")

		# results.each do |tweet|
		# 	puts tweet["created_at"]
		# 	puts tweet["text"]
		# 	puts tweet["retweet_count"]
		# 	puts tweet["favorites_count"]
		# 	puts "----------------------------"
		# end

	end
end
