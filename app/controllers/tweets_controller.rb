class TweetsController < ApplicationController
	def main
		@tweets = Tweet.order(created_at: :desc)
		ap @tweets
	end

	def new
		@user = User.find(params[:user_id])
		@tweet = Tweet.new
	end

	def create
		@tweet = current_user.tweets.new(tweet_params)
		if @tweet.save
			redirect_to user_tweet_path(current_user, @tweet)	
		end
		redirect_to user_path(current_user), alert: "Failed to create Tweet"
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)	
	end
end
