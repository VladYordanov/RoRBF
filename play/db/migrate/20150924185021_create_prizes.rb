class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.integer :price
      t.integer :is_in_stock
      t.integer :in_stock

      t.timestamps null: false
    end
  end
end
