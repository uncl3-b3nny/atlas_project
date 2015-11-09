json.array!(@assemblies) do |assembly|
  json.extract! assembly, :id, :name
  json.url assembly_url(assembly, format: :json)
end
