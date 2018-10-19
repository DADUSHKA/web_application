require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_about_url
    assert_response :success
  end

  test "should get author" do
    get about_author_url
    assert_response :success
  end

end
