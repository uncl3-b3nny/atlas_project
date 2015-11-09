json.array!(@master_plans) do |master_plan|
  json.extract! master_plan, :id, :name, :region_id
  json.url master_plan_url(master_plan, format: :json)
end
