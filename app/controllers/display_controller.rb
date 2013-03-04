class DisplayController < ApplicationController

	skip_before_filter :authenticate_user!
	
	def index
		if signed_in?
			redirect_to events_path
		else
			redirect_to :signup
		end
	end

end
