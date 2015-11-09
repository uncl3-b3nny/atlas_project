json.array!(@a5s) do |a5|
  json.extract! a5, :id
  json.url a5_url(a5, format: :json)
end
