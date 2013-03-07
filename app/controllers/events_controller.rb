class EventsController < ApplicationController

  layout 'minimal'
	#before_filter :authenticate_user!
  # GET /events
  # GET /events.json
  def index
		@events = Event.where("creator_id = ?", current_user.id)
		Invitation.where("email = ? and accepted = ?", current_user.email, true).each do |invitation|
			@events << invitation.event
		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event, :includes => [:thumbnail, :pictures, :videos, :documents] }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
		@event.build_thumbnail

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
		@edit = true
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to "/#{@event.url}" }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

		params[:event][:pictures_attributes].each do |key, value|
			@event.pictures << Picture.create(value)
		end

    respond_to do |format|			
      if @event.save
        format.html { redirect_to "/#{@event.url}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
