require 'test_helper'

class PreferredNamesControllerTest < ActionController::TestCase
  setup do
    @preferred_name = preferred_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preferred_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preferred_name" do
    assert_difference('PreferredName.count') do
      post :create, preferred_name: { name: @preferred_name.name }
    end

    assert_redirected_to preferred_name_path(assigns(:preferred_name))
  end

  test "should show preferred_name" do
    get :show, id: @preferred_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preferred_name
    assert_response :success
  end

  test "should update preferred_name" do
    put :update, id: @preferred_name, preferred_name: { name: @preferred_name.name }
    assert_redirected_to preferred_name_path(assigns(:preferred_name))
  end

  test "should destroy preferred_name" do
    assert_difference('PreferredName.count', -1) do
      delete :destroy, id: @preferred_name
    end

    assert_redirected_to preferred_names_path
  end
end
