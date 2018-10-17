# Author: Sam
require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def sign_in
    # log in as admin
    # rails 5 does not support access to session variables from controller tests.
    # logging in here isn't working. I'm not sure what to do about the preconditions for these tests for validation
    post '/login', params: { email: 'administrator@admin.in', password: 'password'}
  end

  test "should get index" do
    sign_in
    get '/users'
    assert_response :found
  end

  test "should get new" do
    get users_url
    assert_response :found
  end

  test "should create user" do
    post users_url, params: { name: "User", email: "testuser@email.com", password: "password" }
    assert_response :success, "Added the new user"
  end

  test "should show user" do
    get users_url(@user)
    assert_response :found, "To themselves or admin"
  end

  test "should update user" do
    patch users_url(@user), params: { name: "User", email: "testuseragain@email.com", password: "password"  }
    assert_response :unauthorized, "Can only update when logged in"
  end

  test "should destroy user" do
    delete user_path(@user)
    assert_response :found, "Deleted the user"
  end
end