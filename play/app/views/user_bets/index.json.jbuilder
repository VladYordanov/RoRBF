json.array!(@user_bets) do |user_bet|
  json.extract! user_bet, :id, :bet_on_id, :bet_points, :bet_team, :won, :loss, :returned_value, :closed, :user_id, :bet_id
  json.url user_bet_url(user_bet, format: :json)
end
