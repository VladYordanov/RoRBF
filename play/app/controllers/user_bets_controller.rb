class UserBetsController < ApplicationController
  before_action :set_user_bet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /user_bets
  # GET /user_bets.json
  def index
    @user_bets = UserBet.all
  end

  # GET /user_bets/1
  # GET /user_bets/1.json
  def show
  end

  # GET /user_bets/new
  def new
    @user_bet = UserBet.new
    @bet = Bet.find(params[:id])
    @user_bets = UserBet.all
    @user = current_user  


    #checking if the user already has a bet on this match
    @user_bets.each do |bet| 
      if bet.user_id == @user.id 
        if bet.bet_id == @bet.id
          redirect_to root_path
          @already_bet = 1
          break
        end
      end
    end
  end

  # GET /user_bets/1/edit
  def edit
  end

  # POST /user_bets
  # POST /user_bets.json
  def create

    @user_bet = UserBet.new(user_bet_params)
    @bet = Bet.find(params[:id]) 
    @user = current_user

    @user_bet.user_id = @user.id
    @user_bet.bet_id = @bet.id
    @user_bet.save

    #taking the points betted from the user 
    @user = User.find(@user_bet.user_id) 
    @user.points -= @user_bet.bet_points 
    @user.all_bets += 1
    @user.save
    


    respond_to do |format|
      if @user_bet.save
        format.html { redirect_to @user_bet, notice: 'User bet was successfully created.' }
        format.json { render :show, status: :created, location: @user_bet }
      else
        format.html { render :new }
        format.json { render json: @user_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_bets/1
  # PATCH/PUT /user_bets/1.json
  def update
    respond_to do |format|
      if @user_bet.update(user_bet_params)
        format.html { redirect_to @user_bet, notice: 'Bet was successfully created' }
        format.json { render :show, status: :ok, location: @user_bet }
      else
        format.html { render :edit }
        format.json { render json: @user_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_bets/1
  # DELETE /user_bets/1.json
  def destroy
    @user_bet.destroy
    respond_to do |format|
      format.html { redirect_to user_bets_url, notice: 'User bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_bet
      @user_bet = UserBet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_bet_params
      params.require(:user_bet).permit(:bet_on_id, :bet_points, :bet_team, :won, :loss, :returned_value, :closed, :user_id, :bet_id)
    end
end
