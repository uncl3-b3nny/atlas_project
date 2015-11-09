require 'test_helper'

class A5sControllerTest < ActionController::TestCase
  setup do
    @a5 = a5s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a5s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a5" do
    assert_difference('A5.count') do
      post :create, a5: {  }
    end

    assert_redirected_to a5_path(assigns(:a5))
  end

  test "should show a5" do
    get :show, id: @a5
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a5
    assert_response :success
  end

  test "should update a5" do
    patch :update, id: @a5, a5: {  }
    assert_redirected_to a5_path(assigns(:a5))
  end

  test "should destroy a5" do
    assert_difference('A5.count', -1) do
      delete :destroy, id: @a5
    end

    assert_redirected_to a5s_path
  end
end
