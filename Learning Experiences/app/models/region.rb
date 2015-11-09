class Region < ActiveRecord::Base
  belongs_to :country
  # regions could have many countries, depending on how you want to define them. If you decide to go this route, simply create a join table, and add a has_many through relationship to country and region models
  has_many :catalogues

  has_many :master_plans
  has_many :raw_materials
  has_many :registrations
  has_many :participants, through: :registrations
end
