json.array!(@a2s) do |a2|
  json.extract! a2, :id
  json.url a2_url(a2, format: :json)
end
