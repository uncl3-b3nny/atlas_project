#there's no building_id or quantity_id on assemblies because assemblies do not belong_to buildings or quantities. They have_many :buildings, through: :quantities 

#I want to query all assemblies that have_a_building through quantities. 
#by convention, assemblies should not have quantity_ids. If I assign one, I'll should be able to query the database for all assemblies that have_a_building like so:


# I would like to
    # find assemblies
    SELECT  `assemblies`.* FROM `assemblies`
      
      # where quantity_ids match any of the returned quantities. 
      INNER JOIN `quantities` ON `assemblies`.`quantity_id` = `quantities`.`id`
      
      #inner join may be the wrong command for this. I'm not sure exactly what that does, but I've mimicked the other queries' syntax assuming it will check the records in the 'assemblies' table for a quantity_id.

      # where building_ids match any of the returned buildings. 
      INNER JOIN `buildings` ON `quantities`.`building_id` = `buildings`.`id`

      # where lot_ids match any of the returned lots
      INNER JOIN `lots` ON `buildings`.`lot_id` = `lots`.`id`
      
      # where deed_ids match any of the returned deeds
      INNER JOIN `deeds` ON `lots`.`deed_id` = `deeds`.`id`

      # where development_ids match any of the returned developments
      INNER JOIN `developments` ON `deeds`.`development_id` = `developments`.`id`


      # where master_plan_ids match any of the returned master_plans
      INNER JOIN `master_plans` ON `developments`.`master_plan_id` = `master_plans`.`id`


      # where region_ids match any of the returned regions
      INNER JOIN `regions` ON `master_plans`.`region_id` = `regions`.`id`

        # where region.country_id = params[:id] 
        WHERE `regions`.`country_id` = 5

# The above query would require assemblies to have a quantity_id to work. I'm fine doing that, but I'm a little worried I'll break something in active record by doing that. 


'SELECT `quantities`.* FROM `quantities` INNER JOIN `buildings` ON `quantities`.`' at line 1: 
SELECT `assemblies`.* FROM `assemblies` 
  WHERE (quantity_id LIKE SELECT `quantities`.* FROM `quantities` 
    INNER JOIN `buildings` ON `quantities`.`building_id` = `buildings`.`id` 
    INNER JOIN `lots` ON `buildings`.`lot_id` = `lots`.`id` 
    INNER JOIN `deeds` ON `lots`.`deed_id` = `deeds`.`id` 
    INNER JOIN `developments` ON `deeds`.`development_id` = `developments`.`id` 
    INNER JOIN `master_plans` ON `developments`.`master_plan_id` = `master_plans`.`id` 
    INNER JOIN `regions` ON `master_plans`.`region_id` = `regions`.`id` 
      WHERE `regions`.`country_id` = 5)):

SELECT `quantities`.* FROM `quantities` 
  INNER JOIN `buildings` ON `quantities`.` at line 1: SELECT `assemblies`.* FROM `assemblies` 

  WHERE (quantity_id LIKE SELECT quantities`.* FROM `quantities` 
    INNER JOIN `buildings` ON `quantities`.`building_id` = `buildings`.`id` 
    INNER JOIN `lots` ON `buildings`.`lot_id` = `lots`.`id` 
    INNER JOIN `deeds` ON `lots`.`deed_id` = `deeds`.`id` 
    INNER JOIN `developments` ON `deeds`.`development_id` = `developments`.`id` 
    INNER JOIN `master_plans` ON `developments`.`master_plan_id` = `master_plans`.`id` 
    INNER JOIN `regions` ON `master_plans`.`region_id` = `regions`.`id` 

  WHERE `regions`.`country_id` = 5)):


















