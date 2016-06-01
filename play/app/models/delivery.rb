class Delivery < ActiveRecord::Base
  belongs_to :prize

  def create_delivery(the_prize, the_user)
    self.user_id = the_user.id
    self.prize_id = the_prize.id
    self.save

    the_prize.in_stock -= 1
    the_prize.save

    the_user.points = the_user.points - the_prize.price
    the_user.experience += 100
    the_user.save
  end

end
