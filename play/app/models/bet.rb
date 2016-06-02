
class Bet < ActiveRecord::Base
  has_many :user_bets

  def finish_match(user_bets, the_users, the_bet)
    user_bets.each do |user_bet|
      the_users.each do |the_user|
        if user_bet.user_id == the_user.id && user_bet.bet_on_id == the_bet.winner
          user_bet.won = 1
          case the_bet.winner
          when 1 then user_bet.returned_value = ( (1 - the_bet.team_one_chance / 100) * user_bet.bet_points ) + user_bet.bet_points
          when 2 then user_bet.returned_value = ( (1 - the_bet.team_two_chance / 100) * user_bet.bet_points ) + user_bet.bet_points
          end

          user_bet.exp_change = user_bet.bet_points / 4
          user_bet.save

          the_user.won_bets += 1
          the_user.points += user_bet.returned_value
          the_user.experience += user_bet.exp_change
          the_user.save

        elsif user_bet.user_id == the_user.id && user_bet.bet_on_id != the_bet.winner
          user_bet.loss = 1
          user_bet.exp_change = -( user_bet.bet_points / 8 )
          user_bet.save
          the_user.lost_bets += 1
          the_user.experience += user_bet.bet_points / 8
          the_user.save
        end

        case the_user.experience
        when 100..300 then user.level = 1
        when 301..600 then user.level = 2
        when 601..1000 then user.level = 3
        when 1_001..1_700 then user.level = 4
        when 1_701..3_500 then user.level = 5
        when 3_501..5_000 then user.level = 6
        when 5_001..7_000 then user.level = 7
        when 7_001..9_500 then user.level = 8
        when 9_501..11_150 then user.level = 9
        when 11_150..14_000 then user.level = 10
        end
        the_user.save

      end
    end
  end
end
