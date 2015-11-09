class Quantity < ActiveRecord::Base
  #rather than having ~15 separate join tables, I'm using one
  belongs_to :building
  belongs_to :assembly
  belongs_to :a2
  belongs_to :a3
  belongs_to :a4
  belongs_to :a5
  belongs_to :part
  belongs_to :raw_material
  
  belongs_to :design
  belongs_to :milestone
  belongs_to :labor
  belongs_to :inventory
  belongs_to :credit
  belongs_to :debt
  belongs_to :participant
end
