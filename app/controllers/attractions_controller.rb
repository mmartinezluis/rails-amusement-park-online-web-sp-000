class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
    @ride = Ride.new(attraction_id: @attraction.id, user_id: @user.id)
  end

#   def ride
#     @attraction = Attraction.find(params[:id])
#     @user = current_user
#     if @user.tall_enough(@attraction) && @user.enough_tickets(@attraction)
#       @user.tickets -= @attraction.tickets
#       @user.save
#       render :'users/show'
#     elsif !@user.tall_enough(@attraction) && !@user.enough_tickets(@attraction)
#       @user.errors[:height] << "You are not tall enough to ride the #{@attraction.name}"
#       @user.errors[:tickets] << "You do not have enough tickets to ride the #{@attraction.name}"
#       render :'users/show'
#     elsif !@user.enough_tickets(@attraction)
#       @user.errors[:tickets] << "You do not have enough tickets to ride the #{@attraction.name}"
#       render :'users/show'
#     elsif !@user.tall_enough(@attraction)
#         #render :'attractions/show'
#       @user.errors[:height] << "You are not tall enough to ride the #{@attraction.name}"
#       render :'users/show'
#     end
#   end
 
  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end
  
  private
  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end