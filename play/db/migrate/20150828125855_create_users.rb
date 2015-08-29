class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :points
      t.integer :all_bets
      t.integer :curr_bets
      t.integer :won_bets
      t.integer :lost_bets

      t.timestamps null: false
    end
  end
end
