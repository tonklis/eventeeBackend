class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]
	
	def index
		if signed_in?
			redirect_to dashboard_path
		end
	end

	def dashboard

	end

end
