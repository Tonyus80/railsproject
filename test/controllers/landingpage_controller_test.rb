require "test_helper"

class LandingpageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @profile = profiles(:one)
    post profiles_url, params: { profile: { address: @profile.address, medical_license: @profile.medical_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_num: @profile.pps_num, user_id: @profile.user_id } }
  end


  test "should get index" do
    get root_url
    assert_response :success
  end



end
