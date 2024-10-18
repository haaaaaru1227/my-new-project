require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get woman" do
    get static_woman_url
    assert_response :success
  end
end
