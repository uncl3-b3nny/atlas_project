json.array!(@a4s) do |a4|
  json.extract! a4, :id
  json.url a4_url(a4, format: :json)
end
