require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get standby" do
    get pages_standby_url
    assert_response :success
  end

  test "should get thesis" do
    get pages_thesis_url
    assert_response :success
  end

end
