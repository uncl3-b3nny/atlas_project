class BuildingProduct < ActiveRecord::Base
  has_many :product_raw_materials
  belongs_to :building
  belongs_to :product
end
