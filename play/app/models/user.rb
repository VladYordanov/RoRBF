class User < ActiveRecord::Base
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :user_bets
	has_many :prizes
	has_many :deliveries

	def calc_experience(end_points, start_points)
		@max_points_of_level = start_points.to_i
		return ( ( experience - end_points ) * 100 ) / ( start_points - end_points )
	end

	#converts /user/id to /user/name
	def to_param
		username
	end 
end
