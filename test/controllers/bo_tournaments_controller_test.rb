require 'test_helper'

class BoTournamentsControllerTest < ActionController::TestCase
  setup do
    @bo_tournament = bo_tournaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bo_tournaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bo_tournament" do
    assert_difference('BoTournament.count') do
      post :create, bo_tournament: { bo_id: @bo_tournament.bo_id, tournament_id: @bo_tournament.tournament_id }
    end

    assert_redirected_to bo_tournament_path(assigns(:bo_tournament))
  end

  test "should show bo_tournament" do
    get :show, id: @bo_tournament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bo_tournament
    assert_response :success
  end

  test "should update bo_tournament" do
    patch :update, id: @bo_tournament, bo_tournament: { bo_id: @bo_tournament.bo_id, tournament_id: @bo_tournament.tournament_id }
    assert_redirected_to bo_tournament_path(assigns(:bo_tournament))
  end

  test "should destroy bo_tournament" do
    assert_difference('BoTournament.count', -1) do
      delete :destroy, id: @bo_tournament
    end

    assert_redirected_to bo_tournaments_path
  end
end
