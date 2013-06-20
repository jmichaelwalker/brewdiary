class Recipe < ActiveRecord::Base
  attr_accessible :recipe_name
  attr_accessible :recipe_type
  attr_accessible :brew_date
  attr_accessible :yeast_starter
  attr_accessible :batch_size
  attr_accessible :mash_time
  attr_accessible :mash_temp
  attr_accessible :mash_steps
  attr_accessible :boil_time
  attr_accessible :pri_ferm_days
  attr_accessible :pri_ferm_temp
  attr_accessible :pri_ferm_notes
  attr_accessible :sec_ferm_days
  attr_accessible :sec_ferm_temp
  attr_accessible :sec_ferm_notes     
  attr_accessible :org_gravity
  attr_accessible :org_gravity_temp
  attr_accessible :final_gravity
  attr_accessible :final_gravity_temp
  attr_accessible :ibu
  attr_accessible :color
  attr_accessible :cooking_steps
  attr_accessible :taste_rating
  attr_accessible :tasting_notes
  attr_accessible :review
end

