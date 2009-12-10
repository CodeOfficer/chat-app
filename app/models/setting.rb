class Setting < ActiveRecord::Base

  belongs_to :user

  attr_accessible :text_color

end
