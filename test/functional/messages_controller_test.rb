require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  def test_create_invalid
    Message.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Message.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
end
