class UserMailer < ActionMailer::Base
	default from: "\"eventee\" <info@eventee.co>"

	def new_invitation event_id, email_address, invitation_id, token
		@event = Event.find(event_id)
		@invitation = Invitation.find(invitation_id)
		@token = token
	 	mail(:to => email_address, :subject => "#{@event.creator.first_name} wants to share an eventee with you.")
	end
end
