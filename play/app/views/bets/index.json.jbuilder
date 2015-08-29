json.array!(@bets) do |bet|
  json.extract! bet, :id, :team_one, :team_two, :team_one_chance, :team_two_chance, :team_one_value, :team_two_value, :winner, :bets_on_team_one, :bets_on_team_two, :can_bet
  json.url bet_url(bet, format: :json)
end
