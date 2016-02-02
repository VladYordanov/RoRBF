class AddDescriptionToPrize < ActiveRecord::Migration
  def change
  	add_column(:prizes, :description, :text)
  end
end
