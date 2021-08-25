require "test_helper"

class EpicTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "SVR", email: "s@s.com")
    @project = Project.create(name: "TEST PROJECT", user: @user, description: "slkdflskdm")
    @validEpic = @project.epics.create(content: "this is a test Epic")
    @noContent = @project.epics.new()
    @noProject = Epic.new(content: "blahblahblahblah")
    @duplicate = @project.epics.new(content: "this is a test Epic")
  end
  
  def teardown
    @user.destroy!
    @project.destroy!
    @validEpic.destroy!
  end

  test "valid epic" do
    assert @validEpic.valid?
  end
  
  test "invalid without content" do
    assert_not @noContent.valid?    
  end
  
  test "invalid without project" do
    assert_not @noProject.valid?    
  end
  
  test "invalid if epic is a duplicate within a given project" do
    assert_not @duplicate.valid?
  end


end
