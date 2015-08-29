class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :team_one
      t.string :team_two
      t.integer :team_one_chance
      t.integer :team_two_chance
      t.integer :team_one_value
      t.integer :team_two_value
      t.integer :winner
      t.integer :bets_on_team_one
      t.integer :bets_on_team_two
      t.integer :can_bet

      t.timestamps null: false
    end
  end
end
