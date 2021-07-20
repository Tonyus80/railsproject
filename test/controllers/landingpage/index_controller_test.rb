require "test_helper"

class Landingpage::IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landingpage_index_index_url
    assert_response :success
  end

  test "should get view" do
    get landingpage_index_view_url
    assert_response :success
  end
end
