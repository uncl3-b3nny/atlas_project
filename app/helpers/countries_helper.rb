module CountriesHelper
    def predicted_single_family_homes_needed(territory)
    territory.population*territory.estimated_single_family_home_demand/100/territory.estimated_occupants_per_single_family_home_unit
  end
  
  def predicted_multi_family_homes_needed(territory)
    territory.population*territory.estimated_multi_family_home_demand/100/territory.estimated_occupants_per_multi_family_home_unit
  end

  def net_predicted_homes_needed(territory)
    predicted_single_family_homes_needed(territory) + predicted_multi_family_homes_needed(territory)
  end

  def number_of_single_family_homes_sold_at_given_market_penetration(territory)
    predicted_single_family_homes_needed(territory)*territory.percent_market_penetration_goal/100
  end

  def number_of_multi_family_homes_sold_at_given_market_penetration(territory)
    predicted_multi_family_homes_needed(territory)*territory.percent_market_penetration_goal/100
  end
  
  def predicted_value_generated(territory)
    net_predicted_homes_needed(territory)*territory.average_estimated_home_value
  end

  def predicted_profit_generated(territory)
    predicted_value_generated(territory)*territory.percent_margin/100
  end

  def make_a_number_more_human(the_number_we_want_to_make_human)
    x = the_number_we_want_to_make_human.to_s.size
    if x>15
      "I can't wrap my head around that number."      
    elsif x>12
      "#{the_number_we_want_to_make_human/1000000000000} TRILLION."
    elsif x>9
      "#{the_number_we_want_to_make_human/1000000000} BILLION."
    elsif x>6
      "#{the_number_we_want_to_make_human/1000000} Million."
    elsif x>3
      "Thousand."
    else
      "This won't be worth it"      
    end
  end

  #loop through every raw_material used in this territory
  def gross_raw_materials_needed(territory) # a method to sum up all the raw materials required for this territory and return them by [name:, & value:] hashes in an array 
    #for each building in the territory
    territory.buildings.each do |building|      
      all_related_raw_materials(building)
    end
    @array_of_hashes_of_related_raw_materials
  end

  #my approach was flawed. The "super join" will be unable to access parents and return quantities accurately. I must use either direct relationships or conventional naming & tables for joining. 

  def actual_profit
  end

  def actual_value_created
    territory.buildings.count*avg_unit_value*margin
  end

  def actual_accounts_receivable
    territory.debts.units.count*avg_unit_value
  end

  def actual_realized_profits
    territory.credits.count*avg_unit_value
  end

  def actual_homes_built
    territory.buildings.single_family_dwellings.count
  end

  def current_cycle
  end

  def expected_cycles_necessary_to_complete_goal
  end

  def cycle_table
    #Cycle table showing estimated length of time to complete each cycle
  end
  def labor_required
    #how much is required? is it available? perhaps should be an object?
  end
  def labor_provided
    # list of participants who supplied the labor
  end
  def quality_control_approval#should probably be a boolean attribute
    
  end
end
