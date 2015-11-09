class MasterPlan < ActiveRecord::Base
  belongs_to :region
  has_many :developments

#   / So the classification has to be something like "long term dwelling" or "transient dwelling" or "short term, transient dwelling". What things do long term have vs short term? Amenities. Upkeep machines, tools, storage => clothes washing & drying, dish washing & drying, cleaning supplies storage, and food prep & storage are all larger/better for long-term. (mini-fridge vs refrigerator freezer combo, oven vs microwave, roomba vs nothing, lawn mower vs nothing) So we examine the quantity of laundry machines, bathrooms, & storage to estimate the net long term housing demand? yeah, thats pretty good: 

# / WHY DO WE HAVE ZONES? to lead mass behavior towards a healthy, enjoyable balance of built envioronments, to inform public infrastructure choices, and in some cases zoning laws are applied to protect ignorant inhabitants from harmful built environments. (Some factory processes should be kept away from places that people breath, eat, sleep, etc. Babies need lots of sleep, and no one wants a jackhammer, or a drunken party waking them up. There needs to be adequate consideration of all lifestyles when masterplanning)
end
