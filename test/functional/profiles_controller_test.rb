require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jason).profile_name
    assert_response :success
    assert_template 'profiles/show'

  end

  test "if profile_name isn't found, render a 404" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found

  end

  test "correctly assigned variable when we get show page" do
  	get :show, id: users(:jason).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only the correct statuses are shown on a user" do
  	get :show, id: users(:jason).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jason), status.user
  	end
  end 

end
