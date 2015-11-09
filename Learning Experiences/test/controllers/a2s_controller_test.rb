require 'test_helper'

class A2sControllerTest < ActionController::TestCase
  setup do
    @a2 = a2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a2" do
    assert_difference('A2.count') do
      post :create, a2: {  }
    end

    assert_redirected_to a2_path(assigns(:a2))
  end

  test "should show a2" do
    get :show, id: @a2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a2
    assert_response :success
  end

  test "should update a2" do
    patch :update, id: @a2, a2: {  }
    assert_redirected_to a2_path(assigns(:a2))
  end

  test "should destroy a2" do
    assert_difference('A2.count', -1) do
      delete :destroy, id: @a2
    end

    assert_redirected_to a2s_path
  end
end
