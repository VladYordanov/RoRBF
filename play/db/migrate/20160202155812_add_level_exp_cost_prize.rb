class AddLevelExpCostPrize < ActiveRecord::Migration
  def change
  	add_column(:prizes, :exp_price, :integer)
  	add_column(:prizes, :level_needed, :integer)
  end
end
