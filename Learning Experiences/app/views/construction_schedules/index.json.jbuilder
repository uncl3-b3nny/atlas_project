json.array!(@construction_schedules) do |construction_schedule|
  json.extract! construction_schedule, :id, :building_id, :lot_id
  json.url construction_schedule_url(construction_schedule, format: :json)
end
