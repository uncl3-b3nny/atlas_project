require 'test_helper'

class ManufacturingProcessesControllerTest < ActionController::TestCase
  setup do
    @manufacturing_process = manufacturing_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturing_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacturing_process" do
    assert_difference('ManufacturingProcess.count') do
      post :create, manufacturing_process: { name: @manufacturing_process.name }
    end

    assert_redirected_to manufacturing_process_path(assigns(:manufacturing_process))
  end

  test "should show manufacturing_process" do
    get :show, id: @manufacturing_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manufacturing_process
    assert_response :success
  end

  test "should update manufacturing_process" do
    patch :update, id: @manufacturing_process, manufacturing_process: { name: @manufacturing_process.name }
    assert_redirected_to manufacturing_process_path(assigns(:manufacturing_process))
  end

  test "should destroy manufacturing_process" do
    assert_difference('ManufacturingProcess.count', -1) do
      delete :destroy, id: @manufacturing_process
    end

    assert_redirected_to manufacturing_processes_path
  end
end
