json.array!(@prizes) do |prize|
  json.extract! prize, :id, :name, :price, :is_in_stock, :in_stock
  json.url prize_url(prize, format: :json)
end
