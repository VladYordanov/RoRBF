class AddRelationDeliveryPrize < ActiveRecord::Migration
  def change
  	add_column(:deliveries, :prize_id, :integer)
  end
end
