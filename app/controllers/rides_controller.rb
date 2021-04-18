class RidesController < ApplicationController
  def create
    ride = Ride.create(params.require(:ride).permit(:attraction_id, :user_id))
    flash[:msg] = ride.take_ride
    redirect_to user_path(current_user)
  end
end