class LandingPageController < ApplicationController
	skip_before_action :require_login

	def index
		if logged_in?
			redirect_to user_index_path
		end
	end
end
