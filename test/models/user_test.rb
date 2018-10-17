# Author: Sam
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new
    user.name = ""
    assert_not user.save
  end

  test "should not save user without email" do
    user = User.new
    user.email = ""
    assert_not user.save
  end

  test "should not save user with password less than 8 chars" do
    user = User.new
    user.name = "User"
    user.email = "user@email.com"
    user.password = "passwor"
    assert_not user.save
  end

  test "should not save user with existing email" do
    user = User.new
    user.name = "User"
    user.email = "realestateagent@realtor.in"
    user.password = "password"
    user.roles = 1
    assert_not user.save
  end
end