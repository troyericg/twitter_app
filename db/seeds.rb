# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@statuses = Status.create([{
	screen_name: 'JSilz911',
	real_name: 'Jes Silverman',
	num_statuses: '900',
	num_following: '20',
	num_followers: '1000',
	img_url: 'http://placekitten.com/g/150/150',
	tweet_body: 'Get some!',
	}])