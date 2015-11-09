class Building < ActiveRecord::Base
# The building should belong to a participant through a deed, but since a deed can "leave" the the country and the building can't leave the lot, the building should belong_to a country/region/master_plan/development through a lot. 
  belongs_to :lot
  belongs_to :deed
  
  #be sure to use the bill_of_materials helper
  has_one  :construction_schedule

  has_many :blueprints
  has_many :floorplans

#It was either build a million join tables, & use convention, or build one, and use common sense. I went with the latter. 

  #Buildings can have many assemblies of assemblies "down" through the tiers
  has_many :a4s, through: :a5s
    has_many :a3s, through: :a4s
      has_many :a2s, through: :a3s
        has_many :assemblies, through: :a2s
  #Or directly through quantities            
  has_many :quantities
  has_many :a5s, through: :quantities
  has_many :a4s, through: :quantities
  has_many :a3s, through: :quantities
  has_many :a2s, through: :quantities
  has_many :assemblies, through: :quantities
    has_many :parts, through: :assemblies 
      has_many :raw_materials, through: :parts
    has_many :parts, through: :quantities
    has_many :raw_materials, through: :quantities 

  # has_many :design_buildings
  # has_many :designs, through: :design_buildings
end
