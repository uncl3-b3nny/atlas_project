json.array!(@designs) do |design|
  json.extract! design, :id, :name, :designer
  json.url design_url(design, format: :json)
end
