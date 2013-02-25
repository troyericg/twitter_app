require 'rubygems'
require 'json'
require 'open-uri'
require 'rest-client'

class TweetsController < ApplicationController
	def index
		@statuses = Status.all
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @status }
		end
	end

	def new
		@status = Status.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @status }
		end
	end
end