class SessionsController < ApplicationController
	def create
		ap "INSIDE SESSIONS#CREATE!!"
		ap params
		user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
		if user
			session[:user_id] = user.id
			redirect_to user, notice: "SUCCESS! FOUND USER"
		else
			flash[:notice] = "WOMP WOMP. NO USER FOUND"
			redirect_to root_path
		end
	end
end
