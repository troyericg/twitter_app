require 'rubygems'
require 'json'
require 'open-uri'
require 'rest-client'


namespace :tweet do
	desc "testing tweets"
	task :test => :environment do
		userURL = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
		idURL = "https://api.twitter.com/1/statuses/show.json?id="
		user_id = "301524565425795072"
		user_name = "JSilz911"
		twitter_user_url = userURL + user_name
		twitter_id_url = idURL + user_id
		
		# puts Float(user_id[0,1])
		# puts Float(user_id[0,1]).class == Float
		# puts Float(user_name[0,1])

		if user_id[0,1].match(/[0-9]/.to_s)
			puts "This matches a number"
		elsif !user_id[0,1].match(/[0-9]/.to_s)
			puts "This does NOT match a number"
		end

		
		
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
