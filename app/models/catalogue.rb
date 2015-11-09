class Catalogue < ActiveRecord::Base
  belongs_to :region 

  has_many :catalogue_designs
  has_many :designs, through: :catalogue_designs

  has_many :floorplans,    through: :designs
  has_many :blueprints,    through: :designs
  has_many :a5,            through: :designs
  has_many :a4,            through: :designs
  has_many :a3,            through: :designs
  has_many :a2,            through: :designs
  has_many :assemblies,    through: :designs
  has_many :parts,         through: :designs
  has_many :raw_materials, through: :designs
end
