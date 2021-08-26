require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(username: "SVRourke", email: "s@s.com")
    @project = @user.projects.create(name: "Project")
    @epic = @project.epics.create(content: "Epic")
    @story = @epic.stories.create(content: "Story")
    @validProjectComment = @project.comments.create(content: "Project Comment")
    @validEpicComment = @epic.comments.create(content: "Epic Comment")
    @validStoryComment = @story.comments.create(content: "Story Comment")
    @invalidNoContent = @story.comments.new(content: "Story Comment")
    @invalidDuplicate = @story.comments.new(content: "Story Comment")
  end
  
  def teardown
    User.destroy_all
    Project.destroy_all
    Epic.destroy_all
    Story.destroy_all
    Comment.destroy_all
  end

  test "valid comment is valid" do
    assert @validProjectComment.valid?
  end

  test "comment is invalid without content" do
    assert_not @invalidNoContent.valid?
  end

  # test "comment is invalid if duplicate" do
  #   assert_not @invalidDuplicate.valid?
  # end

  test "comment can belong to Story" do
    assert @validStoryComment.valid?
  end

  test "comment can belong to Epic" do
    assert @validEpicComment.valid?
  end

  test "comment can belong to Project" do
    assert @validProjectComment.valid?
  end
end
