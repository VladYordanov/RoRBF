class UserBet < ActiveRecord::Base
  belongs_to :user
  belongs_to :bet

  def user_bet_team_info(bet)
    case bet_on_id
    when 1
      return bet.team_one
    when 2
      return bet.team_two
    end
  end

  def create_user_bet(userBet, bet)
    user = current_user

    userBet.user_id = user.id
    userBet.bet_id = bet.id
    userBet.save

    user.points -= userBet.bet_points
    user.all_bets += 1
    user.save
  end

  def update_bet_stats(userBet, bet)
    case userBet.bet_on_id
    when 1
      bet.bets_on_team_one += 1
    when 2
      bet.bets_on_team_two += 1
    end

    bet.save
  end


end
