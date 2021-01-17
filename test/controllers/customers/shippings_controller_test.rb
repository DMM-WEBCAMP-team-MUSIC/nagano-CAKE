require 'test_helper'

class Customers::ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_shippings_index_url
    assert_response :success
  end

  test "should get edit" do
    get customers_shippings_edit_url
    assert_response :success
  end

end
