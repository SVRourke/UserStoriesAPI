require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "Valid User" do
    user = User.new(username: "SVRourke", email: "samuelvanrourke@gmail.com")
    assert user.valid?
  end
  
  test "invalid if username taken" do
    validUser = User.create(username: "SVRourke", email: "samuelvanrourke@gmail.com")
    invalidUser = User.new(username: "SVRourke", email: "s@gmail.com")
    assert_not invalidUser.valid?
  end
  
  test "invalid without name" do
    user = User.new(email: "s@gmail.com")
    assert_not user.valid?
  end
  
  test "invalid without email" do
    user = User.new(username: "s")
    assert_not user.valid?
  end

end
