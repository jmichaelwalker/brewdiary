class Ingredient < ActiveRecord::Base
  attr_accessible :ing_name
  attr_accessible :ing_type
  attr_accessible :color
  attr_accessible :flav_prof
  attr_accessible :other
  attr_accessible :srm_ibu
  attr_accessible :image_url
end