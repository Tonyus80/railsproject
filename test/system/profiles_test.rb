require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Address", with: @profile.address
    fill_in "First name", with: @profile.first_name
    fill_in "Last name", with: @profile.last_name
    fill_in "Medical license", with: @profile.medical_license
    fill_in "Pps num", with: @profile.pps_num
    fill_in "User", with: @profile.user_id
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @profile.address
    fill_in "First name", with: @profile.first_name
    fill_in "Last name", with: @profile.last_name
    fill_in "Medical license", with: @profile.medical_license
    fill_in "Pps num", with: @profile.pps_num
    fill_in "User", with: @profile.user_id
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
