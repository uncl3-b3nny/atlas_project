json.array!(@raw_materials) do |raw_material|
  json.extract! raw_material, :id
  json.url raw_material_url(raw_material, format: :json)
end
