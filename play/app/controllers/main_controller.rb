class MainController < ApplicationController
	def index
		@user = current_user
		@bets = Bet.all
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
	@bets = Bet.all.where(:game => "lol")
	end

	def csgo_matches
	@bets = Bet.all.where(:game => "csgo")
	end

	def dota2_matches
	@bets = Bet.all.where(:game => "dota2")
	end

	def sc2_matches
	@bets = Bet.all.where(:game => "sc2")
	end

end
