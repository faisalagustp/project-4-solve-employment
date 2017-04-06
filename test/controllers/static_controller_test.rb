require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get '/'
    assert_response :success
  end

end
