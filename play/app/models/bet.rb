class Bet < ActiveRecord::Base
	has_many :user_bets

	def finish_match (userBets, theUsers, theBet)
		userBets.each do |userBet|
			theUsers.each do |theUser|
				if userBet.user_id == theUser.id && userBet.bet_on_id == theBet.winner
					userBet.won = 1;
					case theBet.winner 
					when 1
						userBet.returned_value = ( (1 - theBet.team_one_chance / 100) * userBet.bet_points ) + userBet.bet_points
					when 2
						userBet.returned_value = ( (1 - theBet.team_two_chance / 100) * userBet.bet_points ) + userBet.bet_points
					end

					userBet.exp_change = userBet.bet_points / 4
					userBet.save

					theUser.won_bets += 1 ;
					theUser.points += userBet.returned_value
					theUser.experience += userBet.exp_change
					theUser.save
					
				elsif userBet.user_id == theUser.id && userBet.bet_on_id != theBet.winner
					userBet.loss = 1
          userBet.exp_change = -( userBet.bet_points / 8 )
          userBet.save
          theUser.lost_bets += 1;
          theUser.experience += userBet.bet_points / 8;
          theUser.save
				end		

				case theUser.experience
					when 100..300 then user.level = 1
					when 301..600 then user.level = 2
					when 601..1000 then user.level = 3
					when 1001..1700 then user.level = 4
					when 1701..3500 then user.level = 5
					when 3501..5000 then user.level = 6
					when 5001..7000 then user.level = 7
					when 7001..9500 then user.level = 8
					when 9501..11150 then user.level = 9
					when 11150..14000 then user.level = 10
				end
				theUser.save
					
			end
		end
	end
end
