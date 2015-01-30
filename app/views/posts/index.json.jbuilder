json.array!(@posts) do |post|
  json.extract! post, :id, :model, :price, :brand, :number_of_km, :car_capacity, :description, :user_id, :user_id
  json.url post_url(post, format: :json)
end
