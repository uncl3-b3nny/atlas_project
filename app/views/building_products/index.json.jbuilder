json.array!(@building_products) do |building_product|
  json.extract! building_product, :id, :building_id, :product_id, :quantity
  json.url building_product_url(building_product, format: :json)
end
