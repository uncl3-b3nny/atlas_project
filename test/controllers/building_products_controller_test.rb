require 'test_helper'

class BuildingProductsControllerTest < ActionController::TestCase
  setup do
    @building_product = building_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:building_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create building_product" do
    assert_difference('BuildingProduct.count') do
      post :create, building_product: { building_id: @building_product.building_id, product_id: @building_product.product_id, quantity: @building_product.quantity }
    end

    assert_redirected_to building_product_path(assigns(:building_product))
  end

  test "should show building_product" do
    get :show, id: @building_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @building_product
    assert_response :success
  end

  test "should update building_product" do
    patch :update, id: @building_product, building_product: { building_id: @building_product.building_id, product_id: @building_product.product_id, quantity: @building_product.quantity }
    assert_redirected_to building_product_path(assigns(:building_product))
  end

  test "should destroy building_product" do
    assert_difference('BuildingProduct.count', -1) do
      delete :destroy, id: @building_product
    end

    assert_redirected_to building_products_path
  end
end
