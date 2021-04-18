class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @attraction = self.attraction
    @user = self.user
    if @user.tall_enough(@attraction) && @user.enough_tickets(@attraction)
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      "Thanks for riding the #{@attraction.name}!"
    elsif !@user.enough_tickets(@attraction) && !@user.tall_enough(@attraction)
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif !@user.enough_tickets(@attraction)
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif !@user.tall_enough(@attraction)
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    end
  end
end
