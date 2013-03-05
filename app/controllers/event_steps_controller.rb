class EventStepsController < ApplicationController

	include Wicked::Wizard
	steps :invites, :media
	
	def show
		@event = params[:event_id]
		render_wizard
	end

	def update
		@event = params[:event_id]
		@event.attributes = params[:event]
		render_wizard @event
	end

	private

		def redirect_to_finish_wizard
			redirect_to event_path
		end

end
