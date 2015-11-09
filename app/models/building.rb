class Building < ActiveRecord::Base

  has_many :building_products
  # is this necessary? has_many :products, through: :building_products
  has_many :products, through: :building_products
  has_many :product_raw_materials, through: :building_products
  has_many :raw_materials, through: :product_raw_materials


# The building should belong to a participant through a deed, but since a deed can "leave" the the country and the building can't leave the lot, the building should belong_to a country/region/master_plan/development through a lot. 
  belongs_to :lot
  belongs_to :deed
  
  #be sure to use the bill_of_materials helper
  has_one  :construction_schedule

  has_many :blueprints
  has_many :floorplans

  # has_many :building_designs
  # has_many :designs, through: :building_designs
end
