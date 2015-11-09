class Part < ActiveRecord::Base
  has_many :designs#if i changed this to has_one(like it should probably be, I think that would give me a more useful @part.design method. Why would I ever need many designs? Ahhhh, because I WAS going to make designs the join objec that belonged to many catalogues, but now with catalogue_designs, we don't have to repeat designs, so a part/assembly/floorplan just have 1 design that we can re-use. Nice.)
  has_many :catalogues, through: :designs
  
  has_many :quantities
  has_many :raw_materials, through: :quantities
  has_many :assemblies, through: :quantities
  has_many :buildings, through: :quantities
  accepts_nested_attributes_for :quantities #destroy?
  # has_many :buildings...countries...participants...debts etc, through: :quantities

  has_many :blueprints
  
  has_many :manufacturing_processes
    has_many :factories, through: :manufacturing_processes
      has_many :regions, through: :factories
end
