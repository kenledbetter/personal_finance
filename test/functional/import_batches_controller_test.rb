require 'test_helper'

class ImportBatchesControllerTest < ActionController::TestCase
  setup do
    @import_batch = import_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_batch" do
    assert_difference('ImportBatch.count') do
      post :create, import_batch: {  }
    end

    assert_redirected_to import_batch_path(assigns(:import_batch))
  end

  test "should show import_batch" do
    get :show, id: @import_batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import_batch
    assert_response :success
  end

  test "should update import_batch" do
    put :update, id: @import_batch, import_batch: {  }
    assert_redirected_to import_batch_path(assigns(:import_batch))
  end

  test "should destroy import_batch" do
    assert_difference('ImportBatch.count', -1) do
      delete :destroy, id: @import_batch
    end

    assert_redirected_to import_batches_path
  end
end
