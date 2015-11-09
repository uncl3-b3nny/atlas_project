# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen'}])
  # Mayor.create(name: 'Emanuel', city: cities.first)

  5.times do 
    password = "password15"

    Participant.create([{
      name: Faker::Name.name, 
      password: password, 
      password_confirmation: password,
      approved: 1
      }])
  end

  5.times do 
    Country.create([{
      name: Faker::Address.country, 
      population: Faker::Number.between(2000000, 10000000), 
      abbreviation: :null, 
      approved: 1,
      estimated_occupants_per_single_family_home_unit: Faker::Number.between(2, 4), 
      estimated_occupants_per_multi_family_home_unit: Faker::Number.between(2, 4), 
      estimated_single_family_home_demand: Faker::Number.between(1, 100), 
      estimated_multi_family_home_demand: Faker::Number.between(1, 100), 
      percent_market_penetration_goal: Faker::Number.between(1, 50), 
      average_estimated_home_value: Faker::Number.between(140000, 250000), 
      percent_margin: Faker::Number.between(1, 100)
      }])
  end
 
  15.times do 
    Region.create([{
      country_id: Faker::Number.between(1, 5), 
      description:Faker::Lorem.sentence,
      climate: Faker::Lorem.word,
      approved: 1,
      name: Faker::Address.city, 
      population: Faker::Number.between(2000, 10000), 
      abbreviation: :null, 
      estimated_occupants_per_single_family_home_unit: Faker::Number.between(2, 4), 
      estimated_occupants_per_multi_family_home_unit: Faker::Number.between(2, 4), 
      estimated_single_family_home_demand: Faker::Number.between(1, 100), 
      estimated_multi_family_home_demand: Faker::Number.between(1, 100), 
      percent_market_penetration_goal: Faker::Number.between(1, 50), 
      average_estimated_home_value: Faker::Number.between(140000, 250000), 
      percent_margin: Faker::Number.between(1, 100)
      }])
  end
 
  45.times do 
    MasterPlan.create([{
      approved: 1,
      region_id: Faker::Number.between(1, 10), 
      name: Faker::Company.name, 
      population: Faker::Number.between(200, 1000), 
      abbreviation: :null, 
      estimated_occupants_per_single_family_home_unit: Faker::Number.between(2, 4), 
      estimated_occupants_per_multi_family_home_unit: Faker::Number.between(2, 4), 
      estimated_single_family_home_demand: Faker::Number.between(50,100), 
      estimated_multi_family_home_demand: Faker::Number.between(50,100), 
      percent_market_penetration_goal: Faker::Number.between(1, 50), 
      average_estimated_home_value: Faker::Number.between(140000, 250000), 
      percent_margin: Faker::Number.between(1, 100)
      }])
  end
 
  150.times do 
    Development.create([{
      approved: 1,
      master_plan_id: Faker::Number.between(1, 10), 
      name: Faker::App.name, 
      population: Faker::Number.between(40, 200), 
      abbreviation: :null, 
      estimated_occupants_per_single_family_home_unit: Faker::Number.between(2, 4), 
      estimated_occupants_per_multi_family_home_unit: Faker::Number.between(2, 4), 
      estimated_single_family_home_demand: Faker::Number.between(1, 20), 
      estimated_multi_family_home_demand: Faker::Number.between(1, 20), 
      percent_market_penetration_goal: Faker::Number.between(1, 50), 
      average_estimated_home_value: Faker::Number.between(140000, 250000), 
      percent_margin: Faker::Number.between(1, 100)
      }])

    # Country.create([{name: Faker::Address.country}])
    # State.create([{name:Faker::Address.state, country_id: 1}])
    # County.create([{name:Faker::Address.zip_code, state_id: 1}])
    # Municipality.create([{name:Faker::Name.street_name, county_id: 1, city_id: 1}])
    # City.create([{name:Faker::Address.city}])
    # lots of times do quantities: customize an array of model_names to supply enough of each category to make sense for every house. 
  end
 