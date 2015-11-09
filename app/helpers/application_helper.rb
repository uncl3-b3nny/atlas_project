module ApplicationHelper
  
  def breakeven_quantity(object)
    @cost_of_the_means_of_production = object.cost_of_means_of_production
    @market_price = object.market_price
    @market_bulk_discount = object.market_bulk_discount.to_f
    @additional_discount_needed_to_close_deal = object.additional_discount_needed_to_close_deal.to_f
    @x = ((100-@market_bulk_discount)/100)
    @y = ((100-@additional_discount_needed_to_close_deal)/100)

    break_even_point = 2
    quantity = 1
    until break_even_point <= 1
      puts "#{quantity}"*100
      quantity += 1
      break_even_point = @cost_of_the_means_of_production/(quantity*@market_price*((100-@market_bulk_discount)/100)*((100-@additional_discount_needed_to_close_deal)/100))
      break if break_even_point <= 1
              puts "********quantity gets looped here*********"
              puts "#{quantity}"

    end
    @breakeven_quantity = quantity
    @breakeven_quantity
  end

  def length_of_time_to_break_even(object, input)
    average_production_capacity = object.manufacturing_processes.where('name', input)
    @time = @quantity/average_production_capacity
  end

  def number_of_contracts_needed(local_entity, percent_margin_input)
    local_demand = net_predicted_homes_needed(local_entity)
    number_of_participants = local_entity.Participants.count
    percent_margin = percent_margin_input
    
    @number_of_contracts_needed = (@breakeven_quantity+local_demand)/(number_of_participants*(1+percent_margin))
  end

    def return_all_raw_materials(object)
      #build a hash to store the names and values of raw materials that belong to this "object".
      @my_hash = HashWithIndifferentAccess.new
      
      object.buildings.each do |building|
      building.building_products.each do |building_product|
        #If ancestry allows me to make products belong_to products, then I'll need to write a method to determine if there are progeny building_products, and if so return_all_raw_materials until there there are no progeny left. AND I'll need to check each offspring for more offspring, and again run return_all_raw_materials until none are left. 
        #Otherwise, we'll be using the folliwng on each level of the assembly chain. (parts-a5s)

        building_product.product_raw_materials.each do |building_product_raw_material|
          #First, store the quantity of this particular building_product_raw_material in this variable so we can multiply it by all the appropriate "ancestor" quantities to get the correct value.
          building_product_raw_material_net_quantity = building_product_raw_material.quantity 

            #find each building_product ancestor, and multiply the "net_quantity" by each of their quantities, storing the new value in the variable each time.(this part of the process is to account for the possibility of products made out of other products)
            
            # building_product.ancestors.each do |ancestor_p|#this may require finding all the building_products that match the values stored in building_product.ancestor. Rails may not build building_product.ancestors for me. 
            #   building_product_raw_material_net_quantity = ancestor_p.quantity*building_product_raw_material_net_quantity
            # end#building_product.ancestors.each do |ancestor_p|
          
          #next, multiply the net_quantity by the building_product quantity
          building_product_raw_material_net_quantity = building_product.quantity*building_product_raw_material_net_quantity
          #now that we've accounted for the building_product that this building_product_raw_material belongs to, and all the building_products that this building_product belongs to, we need put the value in a format that we can easily access.
          
          #if the name of the raw material already exists as a key
          x = building_product_raw_material.raw_material.name
          if @my_hash[x] 

          #add the "net_quantity" or 'new_value' to the existing 'old_value' where the keys match
          then #@my_hash[x] = "#{building_product_raw_material_net_quantity+hash[x]}"  
            @hash_2= HashWithIndifferentAccess.new
            @hash_2[x] = building_product_raw_material_net_quantity 
            @my_hash.update(@hash_2) { |key, old_value, new_value| old_value + new_value } #I think this can be simplified... no time now. to do: smooth this out

          #otherwise, add the name of the current building_product_raw_material and its building_product_raw_material_net_quantity as a new key and value pair            
          else @my_hash[x] = building_product_raw_material_net_quantity 
          end#hash.x
        end#bp.building_product_raw_materials.each do |building_product_raw_material|
      end#object.bps.each do |bp|
    end#return_all_raw_materials

    #Start Here: add a loop to this method that finds and returns the RMs of all the products that belong to this product.(building_product_raw_materials that belong indirectly)

  def is_link_active?(clicked_controller)
    "active" if clicked_controller == params[:controller]
  end
  
  def participant_login_links
    if participant_signed_in?
      content_tag(:span, current_participant.name, style: "color:green;") +
        (link_to "Edit", edit_participant_registration_path) +
        (link_to "Log Out", destroy_participant_session_path, method: :delete)
    else
      link_to "Log In", new_participant_session_path
    end
  end

#to do: DRY these up
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
#example of an A3

# drawbridge[
#   lift_door[
#     rope_connection[
#       male_adapter[iron],
#       female_adapter[iron],
#     ], 
#     hinge[
#       screw[iron],
#       hinge_plate[iron],
#       pin[iron],
#     ], 
#     2x4x8[lumber], 
#     bolts[iron], 
#     flat_bar[iron]
#   ], 
  
#   winch[
    
#     handle_connection[
#       male_adapter[iron], 
#       female_adapter[iron]], 
    
#     wallmount[
#       plate[iron],
#       screws[iron],
#       pin[iron],
#       round_bar[iron],
#     ],

#     handle[iron],
#     rope[hemp]
#   ]
# ]
end
