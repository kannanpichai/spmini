require "test_helper"

class SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get slots_list_url
    assert_response :success
  end
end
