require 'test_helper'

class BlueprintsControllerTest < ActionController::TestCase
  setup do
    @blueprint = blueprints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blueprints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blueprint" do
    assert_difference('Blueprint.count') do
      post :create, blueprint: { assembly_id: @blueprint.assembly_id, building_id: @blueprint.building_id, lot_id: @blueprint.lot_id, part_id: @blueprint.part_id }
    end

    assert_redirected_to blueprint_path(assigns(:blueprint))
  end

  test "should show blueprint" do
    get :show, id: @blueprint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blueprint
    assert_response :success
  end

  test "should update blueprint" do
    patch :update, id: @blueprint, blueprint: { assembly_id: @blueprint.assembly_id, building_id: @blueprint.building_id, lot_id: @blueprint.lot_id, part_id: @blueprint.part_id }
    assert_redirected_to blueprint_path(assigns(:blueprint))
  end

  test "should destroy blueprint" do
    assert_difference('Blueprint.count', -1) do
      delete :destroy, id: @blueprint
    end

    assert_redirected_to blueprints_path
  end
end
