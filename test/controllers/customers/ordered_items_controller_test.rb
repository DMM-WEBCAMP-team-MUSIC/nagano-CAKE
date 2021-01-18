require 'test_helper'

class Customers::OrderedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_ordered_items_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_ordered_items_show_url
    assert_response :success
  end

  test "should get new" do
    get customers_ordered_items_new_url
    assert_response :success
  end

  test "should get finish" do
    get customers_ordered_items_finish_url
    assert_response :success
  end

end
