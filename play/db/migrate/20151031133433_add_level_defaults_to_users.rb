class AddLevelDefaultsToUsers < ActiveRecord::Migration
  def change
	change_column_default(:users, :level, 1)
  	change_column_default(:users, :experience, 0)
  end
end
