class AddGamesToBets < ActiveRecord::Migration
  def change
  	add_column(:bets, :game, :string)
  end
end
