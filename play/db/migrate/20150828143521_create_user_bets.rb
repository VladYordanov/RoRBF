class CreateUserBets < ActiveRecord::Migration
  def change
    create_table :user_bets do |t|
      t.integer :bet_on_id
      t.integer :bet_points
      t.integer :bet_team
      t.integer :won
      t.integer :loss
      t.integer :returned_value
      t.integer :closed
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :bet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

end
