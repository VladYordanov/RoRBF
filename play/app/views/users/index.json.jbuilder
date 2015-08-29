json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :points, :all_bets, :curr_bets, :won_bets, :lost_bets
  json.url user_url(user, format: :json)
end
