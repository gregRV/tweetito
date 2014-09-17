class SessionsController < ApplicationController
	def create
		# The line below works, and will return either false, or the User record
		# user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

		# Here is a solution from RailsCasts using #authenticate, which is
		# an instance method provided by has_secure_password
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user, notice: "You've successfully logged in."
		else
			redirect_to root_path, notice: "Log in failed."
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "You've successfully logged out."
	end
end
