class AddStreamToBets < ActiveRecord::Migration
  def change
  	add_column(:bets, :stream_link, :string)
  end
end
