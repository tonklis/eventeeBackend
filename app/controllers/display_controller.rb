class DisplayController < ApplicationController

	skip_before_filter :authenticate_user!

<<<<<<< Updated upstream
	layout 'unique',  only: :unique_page

	def landing_page
		if signed_in?
			redirect_to events_path
		end
	end

=======
	layout 'empty',  only: :unique_page
	
>>>>>>> Stashed changes
	def index
		if signed_in?
			redirect_to events_path
		else
			redirect_to :signup
		end
	end

	def unique_page
		@event = Event.find_by_url(params[:id])
		if current_user
			@confirmed = @event.users.index(current_user) ? true : false
			@creator = @event.creator.id == current_user.id
		end
	end	

	def send_email
		event_id = params[:event_id]
		csv_emails = params[:csv_emails].split(",")
		errors = false
		if csv_emails.length > 0 and event_id
			invitation = nil
			begin
				csv_emails.each do |email|
					token = (SecureRandom.uuid.slice(0,7) + "_#{event_id}")
					invitation = Invitation.create(:email => email, :event_id => event_id, :sent => true, :message => token, :accepted => false )
					UserMailer.new_invitation(event_id, email, invitation.id, token).deliver
				end
			rescue
				invitation.destroy if invitation
				errors = true
			end
		else
			errors = true
		end
		if errors
			respond_to do |format|
    	  format.json { render json: false, status: :unprocessable_entity }
	    end
		else
			respond_to do |format|
    	  format.json { render json: true }
	    end
		end

	end

end
