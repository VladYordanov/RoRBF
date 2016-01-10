class AddDefaultsToBets < ActiveRecord::Migration
  def change
  	change_column_default(:bets, :team_one_chance, 50)
  	change_column_default(:bets, :team_two_chance, 50)
  	change_column_default(:bets, :team_one_value, 2)
  	change_column_default(:bets, :team_two_value, 2)
  	change_column_default(:bets, :can_bet, 1)
  end
end
