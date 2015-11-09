require 'test_helper'

class A3sControllerTest < ActionController::TestCase
  setup do
    @a3 = a3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a3" do
    assert_difference('A3.count') do
      post :create, a3: {  }
    end

    assert_redirected_to a3_path(assigns(:a3))
  end

  test "should show a3" do
    get :show, id: @a3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a3
    assert_response :success
  end

  test "should update a3" do
    patch :update, id: @a3, a3: {  }
    assert_redirected_to a3_path(assigns(:a3))
  end

  test "should destroy a3" do
    assert_difference('A3.count', -1) do
      delete :destroy, id: @a3
    end

    assert_redirected_to a3s_path
  end
end
