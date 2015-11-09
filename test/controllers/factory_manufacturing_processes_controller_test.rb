require 'test_helper'

class FactoryManufacturingProcessesControllerTest < ActionController::TestCase
  setup do
    @factory_manufacturing_process = factory_manufacturing_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factory_manufacturing_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factory_manufacturing_process" do
    assert_difference('FactoryManufacturingProcess.count') do
      post :create, factory_manufacturing_process: { factory_id: @factory_manufacturing_process.factory_id, manufacturing_process_id: @factory_manufacturing_process.manufacturing_process_id }
    end

    assert_redirected_to factory_manufacturing_process_path(assigns(:factory_manufacturing_process))
  end

  test "should show factory_manufacturing_process" do
    get :show, id: @factory_manufacturing_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factory_manufacturing_process
    assert_response :success
  end

  test "should update factory_manufacturing_process" do
    patch :update, id: @factory_manufacturing_process, factory_manufacturing_process: { factory_id: @factory_manufacturing_process.factory_id, manufacturing_process_id: @factory_manufacturing_process.manufacturing_process_id }
    assert_redirected_to factory_manufacturing_process_path(assigns(:factory_manufacturing_process))
  end

  test "should destroy factory_manufacturing_process" do
    assert_difference('FactoryManufacturingProcess.count', -1) do
      delete :destroy, id: @factory_manufacturing_process
    end

    assert_redirected_to factory_manufacturing_processes_path
  end
end
