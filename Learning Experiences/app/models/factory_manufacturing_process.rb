class FactoryManufacturingProcess < ActiveRecord::Base
  belongs_to :factory
  belongs_to :manufacturing_process
end
