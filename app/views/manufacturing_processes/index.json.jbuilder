json.array!(@manufacturing_processes) do |manufacturing_process|
  json.extract! manufacturing_process, :id, :name
  json.url manufacturing_process_url(manufacturing_process, format: :json)
end
