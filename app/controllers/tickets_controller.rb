class TicketsController < ApplicationController
  
  def index
  @tickets = Ticket.all
  end

  def new
  	@ticket = Ticket.new
  end

  def show
  	@tickets = Ticket.find(:id)
  	respond_to do |format|
  		if @tickets.nil?
  			format.html {render :index}
  			format.html {render status: :not_found}
  		else
  		format.html {redirect_to @tickets, notice: "Here you have yo tickets :)"}
  		format.json {render json: @tickets}
  		end
  	end
  end

  def create
  	@ticket = Ticket.new(params[:ticket])
	  	respond_to do |format|
	  		if @ticket.save
		  		format.html {redirect_to @ticket, notice: "Ticket created"}
		  		format.json {render json: @ticket}
		  	else
		  		format.html {render :new}
		  		format.json {render json: @ticket.errors, status: :not_found}
		  	end
      end
  end

  def destroy
  	@ticket = Ticket.find(params[:id])
  	respond_to do |format|
  		@ticket.destroy
  		format.html {redirect_to @ticket, notice: "Ticket removed"}
  		format.json {render status: :no_content}
    end
  end

  def update
  	@ticket = Ticket.find(params[:id])
  	respond_to do |format|
  		@ticket.update(ticket_params)
  		format.html {redirect_to @ticket, notice: "Ticket updated"}
  		format.json {render status: :reset_content}
    end
  end

  def ticket_params
  	params.require(:ticket).permit(:location)
  end
end
