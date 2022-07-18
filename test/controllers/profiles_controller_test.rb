require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    #get '/users/sign_in'
    @user = users(:one)
    sign_in @user
    @profile = profiles(:one)
  end
  # When the user is logged in we want to map a profile to that user
  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { address: @profile.address, medical_license: @profile.medical_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_num: @profile.pps_num, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url (@profile)
    assert_response :success
  end

  test "should get index" do
    #sign_in @user
    get profiles_url(@user, @profile)
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end
  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end
#test
  test "should update an existing profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { address: @profile.address, medical_license: @profile.medical_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_num: @profile.pps_num, user_id: @profile.user_id } }
    end
  end
end
