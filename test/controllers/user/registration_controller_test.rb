require 'test_helper'

class User::RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_registration_new_url
    assert_response :success
  end

  test "should get create" do
    get user_registration_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_registration_destroy_url
    assert_response :success
  end

end
