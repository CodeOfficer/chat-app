class Setting < ActiveRecord::Base

  belongs_to :user

  attr_accessible :text_color
  
  default_value_for :text_color, "#000000"
  
  default_value_for :avatar, "xxx.png"

end
