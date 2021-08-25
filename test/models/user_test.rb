require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @validUser = User.create(username: "SVRourke", email: "samuelvanrourke@gmail.com")
    @invalidUser = User.new(username: "SVRourke", email: "s@gmail.com")
    @nameless = User.new(email: "s@gmail.com")
    @noEmail = User.new(username: "s")
  end
  
  def teardown
    @validUser.destroy!
    @invalidUser.destroy!
    @nameless.destroy!
    @noEmail.destroy!
  end
  
  test "Valid User" do
    assert @validUser.valid?
  end
  
  test "invalid if username taken" do
    assert_not @invalidUser.valid?
  end
  
  test "invalid without name" do
    assert_not @nameless.valid?
  end
  
  test "invalid without email" do
    assert_not @noEmail.valid?
  end

end
