class Deed < ActiveRecord::Base
  belongs_to :development
  belongs_to :participant 

  has_many :lots
  has_many :buildings, through: :lots
end
