require "test_helper"

class StoryTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "SVRourke", email: "s@s.com")
    @project = @user.projects.create(name: "Test Project", description: "this is a test")
    @epic = @project.epics.create(content: "this is an epic")
    @validStory = @epic.stories.create(content: "this is a story")
    @noContent = @epic.stories.new()
    @duplicate = @epic.stories.new(content: "this is a story")
  end

  def teardown
    @user.destroy!
    @project.destroy!
    @epic.destroy!
    @validStory.destroy!
  end

  test "valid story" do
    assert @validStory.valid?
  end

  test "invalid without content" do
    assert_not @noContent.valid?
  end

  test "invalid if duplicate in scope of epic" do
    assert_not @duplicate.valid?
  end

  test "complete defaults to false" do
    assert_not @validStory.complete
  end

end
