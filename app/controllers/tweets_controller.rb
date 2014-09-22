class TweetsController < ApplicationController
	skip_before_action :require_login, :only => :main

	def main
		unless logged_in?
			redirect_to root_path
		else
			@tweets = Tweet.order(created_at: :desc).limit(10)
		end
	end

	def new
		@user = User.find(params[:user_id])
		if @user.id != current_user.id
			redirect_to user_path(current_user), notice: "Access forbidden"
		end
		@tweet = Tweet.new
	end

	def create
		@tweet = current_user.tweets.new(tweet_params)
		if @tweet.save
			redirect_to user_tweet_path(current_user, @tweet)	
		else
			redirect_to user_path(current_user), alert: "Failed to create Tweet"
		end
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)	
	end
end
