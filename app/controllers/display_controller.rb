class DisplayController < ApplicationController

	skip_before_filter :authenticate_user!
	
	def index
		if signed_in?
			redirect_to events_path
		else
			redirect_to :signup
		end
	end

	def send_email
		event_id = params[:event_id]
		csv_emails = params[:csv_emails].split(",")
		if csv_emails.length > 0 and event_id
			csv_emails.each do |email|
				UserMailer.new_invitation(event_id, csv_emails).deliver
			end
			respond_to do |format|
    	  format.json { render json: true }
	    end
		else
			respond_to do |format|
    	  format.json { render json: false, status: :unprocessable_entity  }
	    end

		end

	end

end
