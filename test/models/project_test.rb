# require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "SVRourke", email: "s@s.com")
    @validProject = Project.create(user: @user, name: "First", description: "this is a test")
    @noName = Project.new(user: @user, description: "this is a test")
    @noUser = Project.new(name: "First", description: "this is a test")
    @duplicate = Project.new(user: @user, name: "First", description: "this is a test")
    
  end
  
  def teardown
    @user.destroy!
    @validProject.destroy!
    @noName.destroy!
    @noUser.destroy!
    @duplicate.destroy!
  end

  test "valid project" do
    assert @validProject.valid?
  end
  
  test "invalid without name" do
    assert_not @noName.valid?
  end
  
  test "invalid without user" do
    assert_not @noUser.valid?
  end
  
  test "invalid if the user already has a project with the same name" do
    assert_not @duplicate.valid?
  end
end
