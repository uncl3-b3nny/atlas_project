class Participant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :design_participants
  # has_many :designs, through: :design_participants
  
  has_many :deeds
  has_many :buildings, through: :deeds
  has_many :lots, through: :deeds

 # has_many :registrations
 # has_many :regions, through: :registrations  

 #the participant should belong to the country through a registration. The registration should belong to a country through a region.(their current locale of residence)
end
