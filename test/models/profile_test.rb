require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  #
  test "should create new profile" do
    profile = Profile.new
    assert_not profile.save
  end

  test "should create valid profile" do
    profile = Profile.new(firstname: "tony", lastname: "test", address: "test street", medical_license: "yes", pps_num: "12334DSF")
    assert_not profile.valid?
  end

  test "invalid profile missing  medical_license: " do
    profile = Profile.new(firstname: "tony", lastname: "test", address: "test street", pps_num: "12334DSF")
    assert_not profile.valid?
  end


end
