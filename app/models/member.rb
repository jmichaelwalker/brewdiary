class Member < ActiveRecord::Base
  attr_accessible :username
  attr_accessible :password
  attr_accessible :mem_type
  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :email
  attr_accessible :other
  attr_accessible :reviews
end
