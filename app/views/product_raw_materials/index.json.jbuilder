json.array!(@product_raw_materials) do |product_raw_material|
  json.extract! product_raw_material, :id, :raw_material_id, :product_id, :quantity
  json.url product_raw_material_url(product_raw_material, format: :json)
end
