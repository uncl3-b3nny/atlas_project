json.array!(@natural_resources) do |natural_resource|
  json.extract! natural_resource, :id, :name, :quantity
  json.url natural_resource_url(natural_resource, format: :json)
end
