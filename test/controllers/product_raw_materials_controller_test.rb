require 'test_helper'

class ProductRawMaterialsControllerTest < ActionController::TestCase
  setup do
    @product_raw_material = product_raw_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_raw_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_raw_material" do
    assert_difference('ProductRawMaterial.count') do
      post :create, product_raw_material: { product_id: @product_raw_material.product_id, quantity: @product_raw_material.quantity, raw_material_id: @product_raw_material.raw_material_id }
    end

    assert_redirected_to product_raw_material_path(assigns(:product_raw_material))
  end

  test "should show product_raw_material" do
    get :show, id: @product_raw_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_raw_material
    assert_response :success
  end

  test "should update product_raw_material" do
    patch :update, id: @product_raw_material, product_raw_material: { product_id: @product_raw_material.product_id, quantity: @product_raw_material.quantity, raw_material_id: @product_raw_material.raw_material_id }
    assert_redirected_to product_raw_material_path(assigns(:product_raw_material))
  end

  test "should destroy product_raw_material" do
    assert_difference('ProductRawMaterial.count', -1) do
      delete :destroy, id: @product_raw_material
    end

    assert_redirected_to product_raw_materials_path
  end
end
