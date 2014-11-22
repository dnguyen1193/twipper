class TweetsController < ApplicationController

	before_action :authenticate_user!
	#! -> usually means to raise an error; can also mean that you may be "doing something dangerous"

	def new
		#creates new instance of the object Tweet
		#'@' -> means the view has an access to the variable
		@tweet = Tweet.new
		@tweets = current_user.tweets
		#only shows the tweets that belong to you
		# @tweets = Tweet.all -> variable will hold all the tweets
	end

	# create doesn't have access to the object Tweet since it's not defined here
	def create
		#saves it to database; same as @tweet = Tweet.create(tweet_params) w/ our extra .user 
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "You have successfully created a Tweet!"
		else
			flash[:danger] = "Input isn't correct. Please try again."
		end

		# give create an instance of all the tweets too -> or it can't render
		@tweets = current_user.tweets
		
		#it doesn't need to be rendered on a new page -> just on the same page as the form, the new page
		render 'new'
	end

	def index
		@tweets = Tweet.all.reject {|tweet| tweet.user == current_user}
	end

	private

	def tweet_params
		#requires the tweet object and only takes in the tweet string
		params.require(:tweet).permit(:tweet)
	end
end
