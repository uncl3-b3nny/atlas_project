json.array!(@atlas_registrations) do |atlas_registration|
  json.extract! atlas_registration, :id
  json.url atlas_registration_url(atlas_registration, format: :json)
end
