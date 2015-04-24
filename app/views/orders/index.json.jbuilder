json.array!(@orders) do |order|
  json.extract! order, :id, :address, :city, :state, :zip, :user_id, :item_id, :quantity
  json.url order_url(order, format: :json)
end
