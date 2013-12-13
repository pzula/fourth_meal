json.array!(@restaurant_details) do |restaurant_detail|
  json.extract! restaurant_detail, :id, :phone, :street, :street2, :city, :state, :zip, :description, :hours_id, :delivery, :delivery_range
  json.url restaurant_detail_url(restaurant_detail, format: :json)
end
