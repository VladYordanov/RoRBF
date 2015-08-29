class MainController < ApplicationController
	def index
		@users = User.all
		@bets = Bet.all
	end

	def show
		@user = User.find(params[:id])
		@user_bet = @user.find(params[:id])
	end

	def new_bet
		@user_bet = UserBet.new
	end

	def bet
		@user = User.find(1) #need to fix so it gets the logged in user
		@user_bet = @user.user_bets.find(params[:id])

	end


	private
		def user_bet_params
	      params.require(:user_bet).permit(:bet_on_id, :bet_points, :bet_team, :won, :loss, :returned_value, :closed, :user_id, :bet_id)
	    end
end
