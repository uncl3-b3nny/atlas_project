require 'test_helper'

class ConstructionSchedulesControllerTest < ActionController::TestCase
  setup do
    @construction_schedule = construction_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:construction_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create construction_schedule" do
    assert_difference('ConstructionSchedule.count') do
      post :create, construction_schedule: { building_id: @construction_schedule.building_id, lot_id: @construction_schedule.lot_id }
    end

    assert_redirected_to construction_schedule_path(assigns(:construction_schedule))
  end

  test "should show construction_schedule" do
    get :show, id: @construction_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @construction_schedule
    assert_response :success
  end

  test "should update construction_schedule" do
    patch :update, id: @construction_schedule, construction_schedule: { building_id: @construction_schedule.building_id, lot_id: @construction_schedule.lot_id }
    assert_redirected_to construction_schedule_path(assigns(:construction_schedule))
  end

  test "should destroy construction_schedule" do
    assert_difference('ConstructionSchedule.count', -1) do
      delete :destroy, id: @construction_schedule
    end

    assert_redirected_to construction_schedules_path
  end
end
