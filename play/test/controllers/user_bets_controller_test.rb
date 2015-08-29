require 'test_helper'

class UserBetsControllerTest < ActionController::TestCase
  setup do
    @user_bet = user_bets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_bets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_bet" do
    assert_difference('UserBet.count') do
      post :create, user_bet: { bet_id: @user_bet.bet_id, bet_on_id: @user_bet.bet_on_id, bet_points: @user_bet.bet_points, bet_team: @user_bet.bet_team, closed: @user_bet.closed, loss: @user_bet.loss, returned_value: @user_bet.returned_value, user_id: @user_bet.user_id, won: @user_bet.won }
    end

    assert_redirected_to user_bet_path(assigns(:user_bet))
  end

  test "should show user_bet" do
    get :show, id: @user_bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_bet
    assert_response :success
  end

  test "should update user_bet" do
    patch :update, id: @user_bet, user_bet: { bet_id: @user_bet.bet_id, bet_on_id: @user_bet.bet_on_id, bet_points: @user_bet.bet_points, bet_team: @user_bet.bet_team, closed: @user_bet.closed, loss: @user_bet.loss, returned_value: @user_bet.returned_value, user_id: @user_bet.user_id, won: @user_bet.won }
    assert_redirected_to user_bet_path(assigns(:user_bet))
  end

  test "should destroy user_bet" do
    assert_difference('UserBet.count', -1) do
      delete :destroy, id: @user_bet
    end

    assert_redirected_to user_bets_path
  end
end
