class Design < ActiveRecord::Base
  has_many :tags
  has_many :catalogue_designs
  has_many :catalogues, through: :catalogue_designs
  has_many :quantities

accepts_nested_attributes_for :quantities
  belongs_to :blueprints
  belongs_to :floorplans
  belongs_to :manufacturing_processes

  belongs_to :a5
  belongs_to :a4
  belongs_to :a3
  belongs_to :a2
  belongs_to :assemblies
  belongs_to :parts
  belongs_to :raw_materials

  # accepts_nested_attributes_for :raw_materials, allow_destroy: true 
    #to do: add accepts_nested_attributes_for to parts, & assemblies. decide what makes sense to do with destructions

  #to do: get nested forms working
  #to do: update routes.rb to reflect all relationship changes
  #to do: correct all hierarchy relationships starting with country
  #to do: separate engineering approval & catalogue approval
end
