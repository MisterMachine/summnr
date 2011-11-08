require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    gizmo = users(:one)
    post :create, name: gizmo.name, email: gizmo.email, password: 'g1zm0'
    assert_redirected_to admin_url
    assert_equal gizmo.id session[:user_id]
  end

  test "should fail login" do
    gizmo = users(:one)
    post :create, :name => gizmo.name, :password => 'ouch!'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end

end
