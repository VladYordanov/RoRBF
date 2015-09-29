json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :user_id, :street, :state, :country, :zipcode
  json.url delivery_url(delivery, format: :json)
end
