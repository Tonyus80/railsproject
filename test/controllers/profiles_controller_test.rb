require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #
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

  # # PATCH/PUT /profiles/1 or /profiles/1.json
  # test "should update an existing profile" do
  #   #sign_in @user
  #   #assert_difference('Profile.count') do
  #   patch profiles_url(@user, @profile), params: { profile: { address: @profile.address, medical_license: @profile.medical_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_num: @profile.pps_num, user_id: @profile.user_id } }
  #   #end
  #   #assert_redirected_to profile_url(@user, @profile)
  # #assert_redirected_to profile_url(@profile)
  # end

#test
  test "should update an existing profile" do
    assert_difference('Profile.count') do
      #patch profile_url(@profile) ,params: { profile: { address: @profile.address, medical_license: @profile.medical_license, firstname: @profile.firstname, lastname: @profile.lastname, pps_num: @profile.pps_num, user_id: @profile.user_id } }
      patch profile_url(@profile) ,params: { profile: { firstname: @profile.firstname, lastname: @profile.lastname, address: @profile.address, medical_license: @profile.medical_license, pps_num: @profile.pps_num, user_id: @profile.user_id } }
    end
  end

  test "should delete profile, sign out, and redirect to Home page" do
    assert_difference('Profile.count', -1) do
      delete profile_user_url(@profile)
    end

    assert_redirected_to profiles_url


  end

  # test "should destroy appointment" do
  #   assert_difference('Appointment.count', -1) do
  #     delete appointment_url(@appointment)
  #   end
  #
  #   assert_redirected_to appointments_url
  # end


end
