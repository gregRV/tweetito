class LandingPageController < ApplicationController
	skip_before_action :require_login

	def index
		if logged_in?
			redirect_to tweets_main_path
		end
	end
end
