class MainController < ApplicationController

  def index
    @user = current_user
    @bets = Bet.all
    @starting_soon = Bet.order("match_starts_at ASC").where(:can_bet => "1").first(4)
    @prizes = Prize.order("in_stock ASC").first(3)
  end

  def show
    @user = User.find(params[:id])
  end

  def bet
    @bet = Bet.find(params[:bet_id])
    @user = User.find_by_username(params[:id]) #need to fix so it gets the logged in user
    @user_bet = UserBet.new
    @user_bet.user_id = @user.id
    @user_bet.bet_id = @bet.id
    @user_bet.save
  end

  def lol_matches
    @bets = Bet.all.where(:game => "lol", :can_bet => 1).order("match_starts_at ASC")
    @finished_bets = Bet.order("match_starts_at ASC").where(:winner => [1,2], :game => "lol").first(5)
  end

  def csgo_matches
    @bets = Bet.all.where(:game => "csgo", :can_bet => 1).order("match_starts_at ASC")
    @finished_bets = Bet.order("match_starts_at ASC").where(:winner => [1,2], :game => "csgo").first(5)
  end

  def dota2_matches
    @bets = Bet.all.where(:game => "dota2", :can_bet => 1).order("match_starts_at ASC")
    @finished_bets = Bet.order("match_starts_at ASC").where(:winner => [1,2], :game => "dota2").first(5)
  end

  def sc2_matches
    @bets = Bet.all.where(:game => "sc2", :can_bet => 1).order("match_starts_at ASC")
    @finished_bets = Bet.order("match_starts_at ASC").where(:winner => [1,2], :game => "sc2").first(5)
  end

  def all_matches
    @bets = Bet.all.where(:can_bet => 1).order("match_starts_at ASC")
    @finished_bets = Bet.order("match_starts_at ASC").where(:winner => [1,2]).first(5)
  end

  def prizes
    @prizes = Prize.all
  end

end
