require 'test_helper'

class MatchedNamesControllerTest < ActionController::TestCase
  setup do
    @matched_name = matched_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matched_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matched_name" do
    assert_difference('MatchedName.count') do
      post :create, matched_name: { name: @matched_name.name }
    end

    assert_redirected_to matched_name_path(assigns(:matched_name))
  end

  test "should show matched_name" do
    get :show, id: @matched_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matched_name
    assert_response :success
  end

  test "should update matched_name" do
    put :update, id: @matched_name, matched_name: { name: @matched_name.name }
    assert_redirected_to matched_name_path(assigns(:matched_name))
  end

  test "should destroy matched_name" do
    assert_difference('MatchedName.count', -1) do
      delete :destroy, id: @matched_name
    end

    assert_redirected_to matched_names_path
  end
end
