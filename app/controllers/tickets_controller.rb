class TicketsController < ApplicationController
  
  def index
  end

  def new
  	@ticket = Ticket.new
  def create
  	@ticket = Ticket.new(params[:ticket])
	  	respond to do |format|
	  		if @ticket.save
		  		format.html {redirect_to @ticket, notice: "Ticket created"}
		  		format.json {render json: @ticket}
		  	else
		  		format.html {render :new}
		  		format.json {render json: @ticket.errors, status: :not_found}
		  	end
  end

  def destroy
  	@ticket = Ticket.find(params[:id])
  	respond to do |format|
		@ticket.destroy
		format.html {redirect_to @ticket, notice: "Ticket removed"}
		format.json {render status: :no_content}
  end

  def update
  	@ticket = Ticket.find(params[:id])
  	respond to do |format|
  		@ticket.update!(ticket_params)
  		format.html {redirect_to @ticket, notice: "Ticket updated"}
  		format.json {render status: :reset_content}
  end

  def ticket_params
  	params.require(:ticket).permit(:location)
  end
end
