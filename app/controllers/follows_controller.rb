class FollowsController < ApplicationController
	def create
		@follow = current_user.follows.build(following_id: params[:following_id])
		if @follow.save
			redirect_to user_path(current_user), notice: "Now following"
		else
			redirect_to user_path(current_user), notice: "Failed to follow"
		end
	end

	def destroy
	end
end
