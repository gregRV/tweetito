class UserController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		puts '*'*80
		puts params
		flash[:notice] = 'saved ok!'
		redirect_to :action => 'new'
	end
end
