json.array!(@factory_manufacturing_processes) do |factory_manufacturing_process|
  json.extract! factory_manufacturing_process, :id, :factory_id, :manufacturing_process_id
  json.url factory_manufacturing_process_url(factory_manufacturing_process, format: :json)
end
