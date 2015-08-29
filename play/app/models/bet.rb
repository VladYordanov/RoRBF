class Bet < ActiveRecord::Base
	has_many :user_bets
end
