require 'test_helper'

class Customers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_orders_show_url
    assert_response :success
  end

end
