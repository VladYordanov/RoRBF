class AddBestOfField < ActiveRecord::Migration
  def change
  	add_column(:bets, :bestof, :integer)
  end
end
