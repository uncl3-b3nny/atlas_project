class Product < ActiveRecord::Base
  has_many :building_products

  has_many :buildings, through: :building_products
  
  has_many :product_raw_materials, through: :building_products

  has_many :raw_materials, through: :product_raw_materials
end
