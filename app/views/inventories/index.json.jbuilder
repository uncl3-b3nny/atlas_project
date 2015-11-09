json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :name
  json.url inventory_url(inventory, format: :json)
end
