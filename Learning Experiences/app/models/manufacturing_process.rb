class ManufacturingProcess < ActiveRecord::Base
  has_many :raw_materials

  has_many :factory_manufacturing_processes
    has_many :factories, through: :factory_manufacturing_processes
      has_many :regions, through: :factories
end
