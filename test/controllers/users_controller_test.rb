require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    User.destroy_all
    @user = User.create(username: "SVRourke", email: "s@s.com")
  end

  def teardown
    User.destroy_all
  end

  test "index is a valid path" do 
    get users_url
    assert_response :success
  end
  
  test "index returns a list of all users" do
    get users_url
    users = @response.parsed_body
    assert users["users"].count > 0
  end

  # index returns unauthorized if not logged in

  test "POST create is a valid path" do
    post users_url, params: {user: {username: "kennethBeats", email: "kenny@thepolice.com"}}
    assert_response :success
  end

  test "POST create with valid info creates a new user record" do
    count = User.count
    post users_url, params: {user: {username: "RicoNasty", email: "rico@nasty.com"}}
    data = @response.parsed_body
    assert data["user"]["username"] == "RicoNasty"
  end

  # TODO: POST create returns an error message if a user already exists
  # TODO: POST create logs the user in on success


  # TODO: read is a valid path
    # TODO: read returns the requested user
    # TODO: read returns an error if no user exists
    # TODO: read returns the requested user if authorized

  # TODO: update is a valid path
    # TODO: returns the user's new information on success
    # TODO: a user can only update their own information
  
  # TODO: destroy is a valid path
end
