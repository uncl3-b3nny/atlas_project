json.array!(@deeds) do |deed|
  json.extract! deed, :id
  json.url deed_url(deed, format: :json)
end
