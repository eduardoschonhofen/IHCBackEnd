require 'test_helper'

class InterfaceControllerTest < ActionDispatch::IntegrationTest
  test "should get data" do
    get interface_data_url
    assert_response :success
  end

end
