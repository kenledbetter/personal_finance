require 'test_helper'

class RawNamesControllerTest < ActionController::TestCase
  setup do
    @raw_name = raw_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_name" do
    assert_difference('RawName.count') do
      post :create, raw_name: { name: @raw_name.name }
    end

    assert_redirected_to raw_name_path(assigns(:raw_name))
  end

  test "should show raw_name" do
    get :show, id: @raw_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raw_name
    assert_response :success
  end

  test "should update raw_name" do
    put :update, id: @raw_name, raw_name: { name: @raw_name.name }
    assert_redirected_to raw_name_path(assigns(:raw_name))
  end

  test "should destroy raw_name" do
    assert_difference('RawName.count', -1) do
      delete :destroy, id: @raw_name
    end

    assert_redirected_to raw_names_path
  end
end
