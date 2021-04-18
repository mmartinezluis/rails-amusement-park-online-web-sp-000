class User < ActiveRecord::Base
  has_secure_password
  validates :name, :password, presence: true, on: :create
  #validates :height, :happiness, :nausea, :tickets, presence: true, unless: Proc.new { |u| u.admin == true }
  #validate :attribute_must_be_an_integer
  has_many :rides
  has_many :attractions, through: :rides
  
  def attribute_must_be_an_integer
    attributes = [height, happiness, nausea, tickets]
    attributes.each do |a|
      if a.class != "integer"
        errors.add(:a, "must be an integer")
      end
    end
  end

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end

  # def go_on_ride(attraction)
  #   attraction = Attraction.find.params[:id]
  #   if tall_enough(attraction)
  #     if enough_tickets(attraction)
  #       if tall_enough(attraction) && enough_tickets(attraction)
  #         self.errors.add :, message: ""
  #       else
  #         self.errors.add :, message: ""
  #       end
  #     else
  #       self.errors.add :, message: ""
  #     end
  #   else
  #     self.errors.add :, message: ""
  #   end
  # end


  def tall_enough(attraction)
    self.height >= attraction.min_height
  end
  
  def enough_tickets(attraction)
    self.tickets >= attraction.tickets
  end

end
