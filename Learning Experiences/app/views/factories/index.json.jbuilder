json.array!(@factories) do |factory|
  json.extract! factory, :id, :name, :region_id
  json.url factory_url(factory, format: :json)
end
