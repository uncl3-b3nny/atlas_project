class Blueprint < ActiveRecord::Base
  belongs_to :lot
  belongs_to :building
  belongs_to :part
  belongs_to :assembly
end
