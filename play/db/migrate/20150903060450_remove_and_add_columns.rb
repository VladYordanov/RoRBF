class RemoveAndAddColumns < ActiveRecord::Migration
  def change
  	remove_column(:users, :curr_bets)
  	add_column(:bets, :match_starts_at, :datetime)
  end
end
