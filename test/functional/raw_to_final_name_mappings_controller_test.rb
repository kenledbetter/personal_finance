require 'test_helper'

class RawToFinalNameMappingsControllerTest < ActionController::TestCase
  setup do
    @raw_to_final_name_mapping = raw_to_final_name_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_to_final_name_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_to_final_name_mapping" do
    assert_difference('RawToFinalNameMapping.count') do
      post :create, raw_to_final_name_mapping: { name: @raw_to_final_name_mapping.name }
    end

    assert_redirected_to raw_to_final_name_mapping_path(assigns(:raw_to_final_name_mapping))
  end

  test "should show raw_to_final_name_mapping" do
    get :show, id: @raw_to_final_name_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raw_to_final_name_mapping
    assert_response :success
  end

  test "should update raw_to_final_name_mapping" do
    put :update, id: @raw_to_final_name_mapping, raw_to_final_name_mapping: { name: @raw_to_final_name_mapping.name }
    assert_redirected_to raw_to_final_name_mapping_path(assigns(:raw_to_final_name_mapping))
  end

  test "should destroy raw_to_final_name_mapping" do
    assert_difference('RawToFinalNameMapping.count', -1) do
      delete :destroy, id: @raw_to_final_name_mapping
    end

    assert_redirected_to raw_to_final_name_mappings_path
  end
end
