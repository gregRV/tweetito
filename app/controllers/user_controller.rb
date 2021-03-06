class UserController < ApplicationController
	skip_before_action :require_login, :only => [:new, :create]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to user_path(@user), :notice => 'Saved new user successfully.'
			else
				redirect_to new_user_path, :notice => 'Failed to save new user.'
			end
	end

	def show
		# is this the correct way to eager load for a single record?
		@user = User.includes(:tweets).find(params[:id])
		# figure out good way to include :retweets as well!
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
