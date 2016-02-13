class Delivery < ActiveRecord::Base
	belongs_to :prize

	def create_delivery(thePrize, theUser)
		self.user_id = theUser.id
		self.prize_id = thePrize.id
		self.save

		thePrize.in_stock -= 1
		thePrize.save

		theUser.points = theUser.points - thePrize.price
		theUser.experience += 100
		theUser.save
	end	

end
