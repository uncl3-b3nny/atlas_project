json.array!(@a3s) do |a3|
  json.extract! a3, :id
  json.url a3_url(a3, format: :json)
end
