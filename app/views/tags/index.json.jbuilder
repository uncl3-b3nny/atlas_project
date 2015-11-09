json.array!(@tags) do |tag|
  json.extract! tag, :id, :design_id, :category_name
  json.url tag_url(tag, format: :json)
end
