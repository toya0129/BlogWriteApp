require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get topPage" do
    get pages_topPage_url
    assert_response :success
  end

end
