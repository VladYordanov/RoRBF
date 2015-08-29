class ChangeDefaultValue < ActiveRecord::Migration
  def change
  	change_column_default(:user_bets, :won, 0)
  	change_column_default(:user_bets, :loss, 0)
  	change_column_default(:user_bets, :returned_value, 0)
  	change_column_default(:user_bets, :closed, 0)
  	change_column_default(:user_bets, :bet_team, 0)
  end
end
