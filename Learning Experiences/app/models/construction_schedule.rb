class ConstructionSchedule < ActiveRecord::Base
  has_many :milestones
  belongs_to :building
  belongs_to :lot
end
