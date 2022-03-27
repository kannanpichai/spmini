require "test_helper"

class SlotBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slot_bookings_index_url
    assert_response :success
  end

  test "should get book_slot" do
    get slot_bookings_book_slot_url
    assert_response :success
  end
end
