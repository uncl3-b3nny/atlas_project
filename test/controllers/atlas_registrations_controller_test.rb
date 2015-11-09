require 'test_helper'

class AtlasRegistrationsControllerTest < ActionController::TestCase
  setup do
    @atlas_registration = atlas_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atlas_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atlas_registration" do
    assert_difference('AtlasRegistration.count') do
      post :create, atlas_registration: {  }
    end

    assert_redirected_to atlas_registration_path(assigns(:atlas_registration))
  end

  test "should show atlas_registration" do
    get :show, id: @atlas_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atlas_registration
    assert_response :success
  end

  test "should update atlas_registration" do
    patch :update, id: @atlas_registration, atlas_registration: {  }
    assert_redirected_to atlas_registration_path(assigns(:atlas_registration))
  end

  test "should destroy atlas_registration" do
    assert_difference('AtlasRegistration.count', -1) do
      delete :destroy, id: @atlas_registration
    end

    assert_redirected_to atlas_registrations_path
  end
end
