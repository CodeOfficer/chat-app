class User < ActiveRecord::Base
  
  acts_as_authentic

  has_many :messages
  has_one :setting
  
  after_create :create_default_settings
  
  private
  
  def create_default_settings
    create_setting
  end

end
