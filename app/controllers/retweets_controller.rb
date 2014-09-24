class RetweetsController < ApplicationController
	def create
		@retweet = current_user.retweets.build(tweet_id: params[:tweet_id])
		if @retweet.save
			redirect_to user_path(@retweet.user), notice: "Retweet successful!"
		else
			redirect_to user_tweet_path(@retweet.user, @retweet.tweet), notice: "Retweet failed."
		end
	end
end
