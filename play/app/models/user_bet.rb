class UserBet < ActiveRecord::Base
  belongs_to :user
  belongs_to :bet

  def user_bet_team_info(bet)
    case bet_on_id
    when 1 then return bet.team_one
    when 2 then return bet.team_two
    end
  end

  def create_user_bet(user_bet, bet)
    user = current_user

    user_bet.user_id = user.id
    user_bet.bet_id = bet.id
    user_bet.save

    user.points -= user_bet.bet_points
    user.all_bets += 1
    user.save
  end

  def update_bet_stats(user_bet, bet)
    case user_bet.bet_on_id
    when 1 then bet.bets_on_team_one += 1
    when 2 then bet.bets_on_team_two += 1
    end

    bet.save
  end


end
