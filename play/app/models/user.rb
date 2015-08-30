class User < ActiveRecord::Base
	has_many :user_bets

	def to_param #bet/name/ not /id
		username
	end 
end
