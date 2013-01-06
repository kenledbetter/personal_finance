require 'test_helper'

class FinalNamesControllerTest < ActionController::TestCase
  setup do
    @final_name = final_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:final_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final_name" do
    assert_difference('FinalName.count') do
      post :create, final_name: { name: @final_name.name }
    end

    assert_redirected_to final_name_path(assigns(:final_name))
  end

  test "should show final_name" do
    get :show, id: @final_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final_name
    assert_response :success
  end

  test "should update final_name" do
    put :update, id: @final_name, final_name: { name: @final_name.name }
    assert_redirected_to final_name_path(assigns(:final_name))
  end

  test "should destroy final_name" do
    assert_difference('FinalName.count', -1) do
      delete :destroy, id: @final_name
    end

    assert_redirected_to final_names_path
  end
end
