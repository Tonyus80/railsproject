require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @notification = notifications(:one)
  end
  ## setting up an user
  def setup
    @user = User.create(
      email: 'tony@email.com',
    )
    sign_in @user
  end
  ### accessing to notification page
  test "should get index" do
    get notifications_url
    assert_response :success
  end
end

