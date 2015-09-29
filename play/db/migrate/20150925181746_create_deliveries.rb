class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :street
      t.string :state
      t.string :country
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
