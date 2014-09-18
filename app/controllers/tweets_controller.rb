class TweetsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@tweet = Tweet.new
		ap @user
		ap @tweet
	end

	def create
		ap params
		tweet = current_user.tweets.create(tweet_params)
		redirect_to user_tweet_path(current_user, tweet)
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)	
	end
end
