class AddEmailToDelivery < ActiveRecord::Migration
  def change
  	add_column(:deliveries, :user_email, :string)
  end
end
