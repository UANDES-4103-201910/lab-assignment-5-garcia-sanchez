class EventVenuesController < ApplicationController
  def new
  	@eventvenue = EventVenue.new
  end

  def create
  	@eventvenue = EventVenue.new(params[:user])
  	respond to do |format|
  		if @eventvenue.save
	  		format.html {redirect_to @eventvenue, notice: "eventvenue created"}
	  		format.json {render json: @eventvenue}
	  	else
	  		format.html {render :new}
	  		format.json {render json: @eventvenue.errors, status: :not_found}
	  	end
  end

  def destroy
  	@eventvenue = EventVenue.find(params[:id])
  	respond to do |format|
		@eventvenue.destroy
		format.html {redirect_to @eventvenue, notice: "Event venue removed"}
		format.json {render status: :no_content}
  end

  def update
  	@eventvenue = EventVenue.find(params[:id])
  	respond to do |format|
  		@eventvenue.update!(eventvenues_params)
  		format.html {redirect_to @eventvenue, notice: "Event venue updated"}
  		format.json {render status: :reset_content}
  end
  def eventvenues_params
  	params.require(:eventvenue).permit(:name, :address, :capacity)
  end

end
