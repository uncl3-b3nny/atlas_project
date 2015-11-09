class AddColumnPopulationToModels < ActiveRecord::Migration
  def change #bad habits much?
    
    #countries
    add_column :countries, :population, :integer    
    add_column :countries, :abbreviation, :string
    add_column :countries, :estimated_occupants_per_single_family_home_unit, :integer
    add_column :countries, :estimated_occupants_per_multi_family_home_unit, :integer
    add_column :countries, :estimated_single_family_home_demand, :integer
    add_column :countries, :estimated_multi_family_home_demand, :integer
    add_column :countries, :percent_market_penetration_goal, :integer
    add_column :countries, :average_estimated_home_value, :integer
    add_column :countries, :percent_margin, :integer

    #regions
    add_column :regions, :population, :integer
    add_column :regions, :abbreviation, :string
    add_column :regions, :estimated_occupants_per_single_family_home_unit, :integer
    add_column :regions, :estimated_occupants_per_multi_family_home_unit, :integer
    add_column :regions, :estimated_single_family_home_demand, :integer
    add_column :regions, :estimated_multi_family_home_demand, :integer
    add_column :regions, :percent_market_penetration_goal, :integer
    add_column :regions, :average_estimated_home_value, :integer
    add_column :regions, :percent_margin, :integer    

    #master_plans
    add_column :master_plans, :population, :integer
    add_column :master_plans, :abbreviation, :string
    add_column :master_plans, :estimated_occupants_per_single_family_home_unit, :integer
    add_column :master_plans, :estimated_occupants_per_multi_family_home_unit, :integer
    add_column :master_plans, :estimated_single_family_home_demand, :integer
    add_column :master_plans, :estimated_multi_family_home_demand, :integer
    add_column :master_plans, :percent_market_penetration_goal, :integer
    add_column :master_plans, :average_estimated_home_value, :integer
    add_column :master_plans, :percent_margin, :integer    

    #developments
    add_column :developments, :population, :integer
    add_column :developments, :abbreviation, :string
    add_column :developments, :estimated_occupants_per_single_family_home_unit, :integer
    add_column :developments, :estimated_occupants_per_multi_family_home_unit, :integer
    add_column :developments, :estimated_single_family_home_demand, :integer
    add_column :developments, :estimated_multi_family_home_demand, :integer
    add_column :developments, :percent_market_penetration_goal, :integer
    add_column :developments, :average_estimated_home_value, :integer
    add_column :developments, :percent_margin, :integer    

  end
end
