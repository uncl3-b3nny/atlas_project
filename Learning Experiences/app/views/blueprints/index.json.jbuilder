json.array!(@blueprints) do |blueprint|
  json.extract! blueprint, :id, :lot_id, :building_id, :part_id, :assembly_id
  json.url blueprint_url(blueprint, format: :json)
end
