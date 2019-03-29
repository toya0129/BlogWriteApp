require 'test_helper'

class User::TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_tweets_create_url
    assert_response :success
  end

  test "should get index" do
    get user_tweets_index_url
    assert_response :success
  end

  test "should get destroy" do
    get user_tweets_destroy_url
    assert_response :success
  end

end
