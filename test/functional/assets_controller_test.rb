require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, asset: { assetable_id: @asset.assetable_id, assetable_type: @asset.assetable_type, attachment_content_type: @asset.attachment_content_type, attachment_file_name: @asset.attachment_file_name, attachment_file_size: @asset.attachment_file_size, attachment_updated_at: @asset.attachment_updated_at, type: @asset.type }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should show asset" do
    get :show, id: @asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset
    assert_response :success
  end

  test "should update asset" do
    put :update, id: @asset, asset: { assetable_id: @asset.assetable_id, assetable_type: @asset.assetable_type, attachment_content_type: @asset.attachment_content_type, attachment_file_name: @asset.attachment_file_name, attachment_file_size: @asset.attachment_file_size, attachment_updated_at: @asset.attachment_updated_at, type: @asset.type }
    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, id: @asset
    end

    assert_redirected_to assets_path
  end
end
