class RawMaterial < ActiveRecord::Base
  has_many :designs
  has_many :catalogues, through: :designs

  has_many :quantities
  has_many :parts, through: :quantities
  has_many :assemblies, through: :quantities
  has_many :buildings, through: :quantities
  #has_many :regions, through: :quantities ? this would prevent me from having to ever repeat creating raw_materials. (though if specific stockpiles of raw materials from a region differ chemically from region to region, we may want to keep them separate. For example, if Iron Ore deposits in Liberia has slightly different chemical makeup and require slightly different processing... but then the differences would probably be sorted out in the manufacturing processes, and the names would remain the same... this could probably be handled with a description attribute, or chemical makeup attribute...)
  accepts_nested_attributes_for :quantities
  accepts_nested_attributes_for :designs

  belongs_to :regions #to do:migrate & whitelist region_id & manufacturing_process_id
  belongs_to :manufacturing_processes #may need to make this a has_many through
end
