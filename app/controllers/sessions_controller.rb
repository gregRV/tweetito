class SessionsController < ApplicationController
	def create
		ap "INSIDE SESSIONS#CREATE!!"
		ap params
		# The line below works, and will return either false, or the User record
		# user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

		# Here is a solution from RailsCasts using #authenticate, which is
		# an instance method provided by has_secure_password
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user, notice: "SUCCESS! FOUND USER"
		else
			flash[:notice] = "WOMP WOMP. NO USER FOUND"
			redirect_to root_path
		end
	end
end
