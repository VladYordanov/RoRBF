require 'test_helper'

class BetsControllerTest < ActionController::TestCase
  setup do
    @bet = bets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet" do
    assert_difference('Bet.count') do
      post :create, bet: { bets_on_team_one: @bet.bets_on_team_one, bets_on_team_two: @bet.bets_on_team_two, can_bet: @bet.can_bet, team_one: @bet.team_one, team_one_chance: @bet.team_one_chance, team_one_value: @bet.team_one_value, team_two: @bet.team_two, team_two_chance: @bet.team_two_chance, team_two_value: @bet.team_two_value, winner: @bet.winner }
    end

    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should show bet" do
    get :show, id: @bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet
    assert_response :success
  end

  test "should update bet" do
    patch :update, id: @bet, bet: { bets_on_team_one: @bet.bets_on_team_one, bets_on_team_two: @bet.bets_on_team_two, can_bet: @bet.can_bet, team_one: @bet.team_one, team_one_chance: @bet.team_one_chance, team_one_value: @bet.team_one_value, team_two: @bet.team_two, team_two_chance: @bet.team_two_chance, team_two_value: @bet.team_two_value, winner: @bet.winner }
    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should destroy bet" do
    assert_difference('Bet.count', -1) do
      delete :destroy, id: @bet
    end

    assert_redirected_to bets_path
  end
end
