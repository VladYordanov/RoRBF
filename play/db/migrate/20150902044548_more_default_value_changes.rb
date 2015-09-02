class MoreDefaultValueChanges < ActiveRecord::Migration
  def change
  	change_column_default(:users, :points, 0)
  	change_column_default(:users, :all_bets, 0)
  	change_column_default(:users, :curr_bets, 0)
  	change_column_default(:users, :won_bets, 0)
  	change_column_default(:users, :lost_bets, 0)
  	remove_column(:users, :password)
  end
end
