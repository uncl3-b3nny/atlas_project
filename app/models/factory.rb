class Factory < ActiveRecord::Base
  belongs_to :region
  has_many :factory_manufacturing_processes
  has_many :manufacturing_processes, through: :factory_manufacturing_processes
end
