class AddGameFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column(:users, :level, :integer)
  	add_column(:users, :experience, :integer)
  end
end
