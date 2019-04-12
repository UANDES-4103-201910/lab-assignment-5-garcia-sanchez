class TicketTypesController < ApplicationController
  def index
  end
  
  def new
  	@ticket_type = TicketType.new
  end

  def create
  	@ticket_type = TicketType.new(params[:ticket_type])
	  	respond_to do |format|
	  		if @ticket_type.save
		  		format.html {redirect_to @ticket_type, notice: "Ticket type created"}
		  		format.json {render json: @ticket_type}
		  	else
		  		format.html {render :new}
		  		format.json {render json: @ticket_type.errors, status: :not_found}
		  	end
      end
  end

  def destroy
  	@ticket_type = TicketType.find(params[:id])
  	respond_to do |format|
  		@ticket_type.destroy
  		format.html {redirect_to @ticket_type, notice: "Ticket type removed"}
  		format.json {render status: :no_content}
    end
  end

  def update
  	@ticket_type = Ticket.find(params[:id])
  	respond_to do |format|
  		@ticket_type.update!(events_params)
  		format.html {redirect_to @ticket_type, notice: "Ticket type updated"}
  		format.json {render status: :reset_content}
    end
  end
  def ticket_type_params
  	params.require(:ticket_type).permit(:id)
  end
end
