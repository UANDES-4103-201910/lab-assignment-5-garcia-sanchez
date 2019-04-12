class EventVenuesController < ApplicationController
  def new
  	@event_venue = EventVenue.new
  end

  def create
  	@event_venue = EventVenue.new(params[:user])
  	respond to do |format|
  		if @event_venue.save
	  		format.html {redirect_to @event_venue, notice: "eventvenue created"}
	  		format.json {render json: @event_venue}
	  	else
	  		format.html {render :new}
	  		format.json {render json: @event_venue.errors, status: :not_found}
	  	end
  end

  def destroy
  	@event_venue = EventVenue.find(params[:id])
  	respond to do |format|
		@event_venue.destroy
		format.html {redirect_to @event_venue, notice: "Event venue removed"}
		format.json {render status: :no_content}
  end

  def update
  	@event_venue = EventVenue.find(params[:id])
  	respond to do |format|
  		@event_venue.update(event_venues_params)
  		format.html {redirect_to @event_venue, notice: "Event venue updated"}
  		format.json {render status: :reset_content}
  end
  def event_venues_params
  	params.require(:event_venue).permit(:name, :address, :capacity)
  end

end
