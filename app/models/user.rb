class User < ActiveRecord::Base
  has_secure_password
  validates :name, :password, presence: true, on: :create
  has_many :rides
  has_many :attractions, through: :rides
  
  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end

  def tall_enough(attraction)
    self.height >= attraction.min_height
  end
  
  def enough_tickets(attraction)
    self.tickets >= attraction.tickets
  end
end


# Optional validators:
  # validates :height, :happiness, :nausea, :tickets, presence: true, unless: Proc.new { |u| u.admin == true }
  # validate :attribute_must_be_an_integer

  # def attribute_must_be_an_integer
  #   attributes = [height, happiness, nausea, tickets]
  #   attributes.each do |a|
  #     if a.class != "integer"
  #       errors.add(:a, "must be an integer")
  #     end
  #   end
  # end


  