class Lot < ActiveRecord::Base
  has_many :blueprints
  has_many :buildings 
  
  belongs_to :development
  belongs_to :deed
end
