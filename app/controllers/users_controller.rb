class UsersController < ApplicationController
  def index
  end
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	respond to do |format|
  		if @user.save
	  		format.html {redirect_to @user, notice: "User created"}
	  		format.json {render json: @user}
	  	else
	  		format.html {render :new}
	  		format.json {render json: @user.errors, status: :not_found}
	  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	respond to do |format|
		@user.destroy
		format.html {redirect_to @user, notice: "User removed"}
		format.json {render status: :no_content}
  end

  def update
  	@user = User.find(params[:id])
  	respond to do |format|
  		@user.update(users_params)
  		format.html {redirect_to @user, notice: "User updated"}
  		format.json {render status: :reset_content}
  end
  def users_params
  	params.require(:user).permit(:name)
  end	
  
  def user_with_most_tickets
  	@user = User.find(params[:id])
	sql = "select o.user_id, count(*) as c from orders o, tickets t \
	where t.ticket_id = o.order_id group by o.user_id order by c desc limit 1"
	result = ActiveRecord::Base.connection.execute(sql)
	User.find(result[0]['user_id']) unless result.nil?
	end
end
