class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    if @bet.winner 
      @bet.can_bet = 0
    end

    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finish
    @bet = Bet.find(params[:id])
    @user_bets = UserBet.all
    @users = User.all

    #assigning points to the winners
    # --- 
    # --- check for fixes
    # --- working for now
    @user_bets.each do |user_bet| 
      if user_bet.bet_id == @bet.id 
    
        @users.each do |user|
          if user_bet.user_id == user.id && user_bet.bet_on_id == @bet.winner
            #formula must be edited LATER ON
            user.points += user_bet.bet_points * (@bet.team_one_chance / 10 )
            user.save
          end
        end

      end
    end
  end

  def current_matches
    @bets = Bet.all.where(:can_bet => 1)
  end

  def finished_matches
    @bets = Bet.all.where(:can_bet => 0)
  end

  def lol_matches
    @bets = Bet.all.where(:game => "lol")
  end

  def csgo_matches
    @bets = Bet.all.where(:game => "csgo")
  end

  def dota2_matches
    @bets = Bet.all.where(:game => "dota2")
  end

  def sc2_matches
    @bets = Bet.all.where(:game => "sc2")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:team_one, :team_two, :team_one_chance, :team_two_chance, :team_one_value, :team_two_value, :winner, :bets_on_team_one, :bets_on_team_two, :match_starts_at, :game)
    end
end
