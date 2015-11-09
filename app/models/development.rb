class Development < ActiveRecord::Base
  belongs_to :master_plan

  has_many :deeds
  has_many :lots, through: :deeds
  has_many :buildings, through: :deeds
  # has_many :participants, through: :deeds #this might not work because deeds belong to participants. to do: double check this.
end
