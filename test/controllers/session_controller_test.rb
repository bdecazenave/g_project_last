require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get session_new,_url
    assert_response :success
  end

  test "should get :create," do
    get session_:create,_url
    assert_response :success
  end

  test "should get :destroy" do
    get session_:destroy_url
    assert_response :success
  end

end
