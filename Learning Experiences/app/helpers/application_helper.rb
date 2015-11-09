module ApplicationHelper

    def return_all_raw_materials(object)
      object.bps.each do |bp|
        #If ancestry allows me to make products belong_to products, then I'll need to write a method to determine if there are progeny bps, and if so return_all_raw_materials until there there are no progeny left. AND I'll need to check each offspring for more offspring, and again run return_all_raw_materials until none are left. 
        #Otherwise, we'll be using the folliwng on each level of the assembly chain. (parts-a5s)

        bp.bp_rms.each do |bp_rm|
          #First, store the quantity of this particular building_product_raw_material in this variable so we can multiply it by all the appropriate "ancestor" quantities to get the correct value.
          bp_rm_net_quantity = bp_rm.quantity 

          #find each building_part ancestor, and multiply the "net_quantity" by each of their quantities, storing the new value in the variable each time.(this part of the process is to account for the possibility of products made out of other products)
          bp.ancestors.each do |ancestor_p|#this may require finding all the bps that match the values stored in bp.ancestor. Rails may not build bp.ancestors for me. 
            bp_rm_net_quantity = ancestor_p.quantity*bp_rm_net_quantity
          end#bp.ancestors.each do |ancestor_p|
          
          #next, multiply the net_quantity by the bp quantity
          bp_rm_net_quantity = bp.quantity*bp_rm_net_quantity
          #now that we've accounted for the bp that this bp_rm belongs to, and all the bps that this bp belongs to, we need put the value in a format that we can easily access.

          #build a hash to store the names and values of raw materials that belong to this "object".
          hash = HashWithIndifferentAccess.new
          
          #if the name of the raw material already exists as a key
          if hash.includes bp_rm.rm.name
            #add the "net_quantity" value to the existing value assigned to the matching key
            hash.update[bp_rm.rm.name, hash.bp_rm.quantity + bp_rm_net_quantity]
          else
            #otherwise, add the name of the current bp_rm and its net_quantity as a new key and value pair
            hash.update[bp_rm.rm.name, bp_rm_net_quantity]
          end#if hash.includes bp_rm.rm.name
        end#bp.bp_rms.each do |bp_rm|
      end#object.bps.each do |bp|
      
      #finally, display the names and values of each raw Material in the hash.
      hash.each do |key, value|
        puts key
        puts value
      end#hash.each do |key, value|
    end#return_all_raw_materials

    #Start Here: add a loop to this method that finds and returns the RMs of all the products that belong to this product.(bp_rms that belong indirectly)

    def retrieve_quantities(related_object_model_names)
      @collection_of_related_objects = []
      
      related_object_model_names.each do |model_name|
        resource.quantities.each do |quantity|
          @collection_of_related_objects.push(quantity.model_name)
        end
      end
    
    end#to do: how do i successful pass the model names into this method so i can call it on quantity? 
  

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
