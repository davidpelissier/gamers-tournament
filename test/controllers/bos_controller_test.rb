require 'test_helper'

class BosControllerTest < ActionController::TestCase
  setup do
    @bo = bos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bo" do
    assert_difference('Bo.count') do
      post :create, bo: { name: @bo.name, phase: @bo.phase }
    end

    assert_redirected_to bo_path(assigns(:bo))
  end

  test "should show bo" do
    get :show, id: @bo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bo
    assert_response :success
  end

  test "should update bo" do
    patch :update, id: @bo, bo: { name: @bo.name, phase: @bo.phase }
    assert_redirected_to bo_path(assigns(:bo))
  end

  test "should destroy bo" do
    assert_difference('Bo.count', -1) do
      delete :destroy, id: @bo
    end

    assert_redirected_to bos_path
  end
end
