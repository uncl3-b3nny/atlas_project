require 'test_helper'

class NaturalResourcesControllerTest < ActionController::TestCase
  setup do
    @natural_resource = natural_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:natural_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create natural_resource" do
    assert_difference('NaturalResource.count') do
      post :create, natural_resource: { name: @natural_resource.name, quantity: @natural_resource.quantity }
    end

    assert_redirected_to natural_resource_path(assigns(:natural_resource))
  end

  test "should show natural_resource" do
    get :show, id: @natural_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @natural_resource
    assert_response :success
  end

  test "should update natural_resource" do
    patch :update, id: @natural_resource, natural_resource: { name: @natural_resource.name, quantity: @natural_resource.quantity }
    assert_redirected_to natural_resource_path(assigns(:natural_resource))
  end

  test "should destroy natural_resource" do
    assert_difference('NaturalResource.count', -1) do
      delete :destroy, id: @natural_resource
    end

    assert_redirected_to natural_resources_path
  end
end
