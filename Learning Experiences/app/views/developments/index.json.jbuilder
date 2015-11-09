json.array!(@developments) do |development|
  json.extract! development, :id, :name, :masterplan_id
  json.url development_url(development, format: :json)
end
