class AddMoreInfoToDelivery < ActiveRecord::Migration
  def change
  	add_column(:deliveries, :first_last_name, :text)
  	add_column(:deliveries, :phone_number, :text)
  	add_column(:deliveries, :address_continued, :text)
  end
end
