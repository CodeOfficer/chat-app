class Room < ActiveRecord::Base
  
  default_scope :order => 'rooms.name ASC'
  
  has_many :messages

  attr_accessible :name

end
