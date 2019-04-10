class EventsController < ApplicationController
  
  def new
  	@event = Event.new
  end

  def create
	  @event = Event.new(params[:event])
	  	respond to do |format|
	  		if @event.save
		  		format.html {redirect_to @event, notice: "Event created"}
		  		format.json {render json: @event}
		  	else
		  		format.html {render :new}
		  		format.json {render json: @event.errors, status: :not_found}
		  	end
  end

  def destroy
  	@event = Event.find(params[:id])
  	respond to do |format|
		@event.destroy
		format.html {redirect_to @event, notice: "Event removed"}
		format.json {render status: :no_content}
  end

  def update
  	@event = Event.find(params[:id])
  	respond to do |format|
  		@event.update!(events_params)
  		format.html {redirect_to @event, notice: "Event updated"}
  		format.json {render status: :reset_content}
  end

  def event_params
  	params.require(:event).permit(:id, :name)
  end
end
