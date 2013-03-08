module TweetsHelper

	require 'twitter-text'
	include Twitter::Autolink
 
	def add_links(str)
		auto_link(str).html_safe
	end
end
