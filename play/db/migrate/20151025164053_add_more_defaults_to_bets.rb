class AddMoreDefaultsToBets < ActiveRecord::Migration
  def change
  	change_column_default(:bets, :bets_on_team_one, 0)
  	change_column_default(:bets, :bets_on_team_two, 0)
  end
end
