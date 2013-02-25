require 'rubygems'
require 'json'
require 'open-uri'
require 'rest-client'


namespace :twitter do
	desc "testing tweets"
	task :test => :environment do
		BASE_URL = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
		idURL = "https://api.twitter.com/1/statuses/show.json?id="
		# testID = "https://api.twitter.com/1/statuses/show.json?id=301524565425795072"
		user_name = "JSilz911"
		twitter_user_url = BASE_URL + user_name
		results = JSON.parse(open(twitter_user_url).read)

		# puts results[0]["user"]["screen_name"]
		# puts results[0]["user"]["name"]

		# puts results[0]["user"]["statuses_count"]
		# puts results[0]["user"]["friends_count"]
		# puts results[0]["user"]["followers_count"]

		# puts results[0]["user"]["profile_image_url"].gsub!("_normal","")

		results.each do |tweet|
			puts tweet["created_at"]
			puts tweet["text"]
			puts tweet["retweet_count"]
			puts tweet["favorites_count"]
			puts "----------------------------"
		end

	end
end
