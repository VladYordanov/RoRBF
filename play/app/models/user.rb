class User < ActiveRecord::Base
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :user_bets
	has_many :prizes
	has_many :deliveries

	#converts /user/id to /user/name
	def to_param
		username
	end 
end
