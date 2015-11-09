require 'test_helper'

class A4sControllerTest < ActionController::TestCase
  setup do
    @a4 = a4s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a4s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a4" do
    assert_difference('A4.count') do
      post :create, a4: {  }
    end

    assert_redirected_to a4_path(assigns(:a4))
  end

  test "should show a4" do
    get :show, id: @a4
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a4
    assert_response :success
  end

  test "should update a4" do
    patch :update, id: @a4, a4: {  }
    assert_redirected_to a4_path(assigns(:a4))
  end

  test "should destroy a4" do
    assert_difference('A4.count', -1) do
      delete :destroy, id: @a4
    end

    assert_redirected_to a4s_path
  end
end
