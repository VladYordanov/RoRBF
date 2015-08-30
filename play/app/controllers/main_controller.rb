class MainController < ApplicationController
	def index
		@users = User.all
		@bets = Bet.all
	end

	def show
		@user = User.find(params[:id])
		@user_bet = @user.find(params[:id])
	end

	def bet
		@bet = Bet.find(params[:bet_id])
		@user = User.find_by_username(params[:id]) #need to fix so it gets the logged in user
		@user_bet = UserBet.new
		@user_bet.user_id = @user.id
        @user_bet.bet_id = @bet.id
        @user_bet.save
	end


end
