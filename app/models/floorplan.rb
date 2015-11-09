class Floorplan < ActiveRecord::Base

belongs_to :building

has_many :designs
has_many :catalogues, through: :designs
end
