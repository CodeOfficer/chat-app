class Message < ActiveRecord::Base
  
  default_scope :order => 'messages.created_at ASC'
  
  belongs_to :room
  
  named_scope :for_room, lambda { |id| { :conditions => ['room_id = ?', id], :limit => 5 } }
  
  attr_accessible :body
  
  validates_length_of :body, :within => 1..255
  validates_associated :room
  
end
