class AddExpWonToUserBet < ActiveRecord::Migration
  def change
  	add_column(:user_bets, :exp_change, :integer)
  end
end
