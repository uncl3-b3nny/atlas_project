json.array!(@lots) do |lot|
  json.extract! lot, :id, :development_id
  json.url lot_url(lot, format: :json)
end
