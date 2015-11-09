json.array!(@catalogues) do |catalogue|
  json.extract! catalogue, :id, :name, :region_id
  json.url catalogue_url(catalogue, format: :json)
end
