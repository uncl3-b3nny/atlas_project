json.array!(@labors) do |labor|
  json.extract! labor, :id
  json.url labor_url(labor, format: :json)
end
