class ProductRawMaterial < ActiveRecord::Base
  belongs_to :building_product
  belongs_to :raw_material
end
