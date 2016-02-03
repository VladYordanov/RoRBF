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


    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to finished_match_bets_path, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: finished_match_bets_path }
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

  def finished
    @bet = Bet.find(params[:id]);
    @bet.can_bet = 0;
    @bet.save

    @user_bets = UserBet.all.where(:bet_id => @bet.id)
    @users = User.all

    @user_bets.each do |user_bet| 
      if user_bet.bet_id == @bet.id 
    
        @users.each do |user|
          if user_bet.user_id == user.id && user_bet.bet_on_id == @bet.winner 
            user_bet.won = 1;

            if @bet.winner == 1
              user_bet.returned_value = ( (1 - @bet.team_one_chance / 100) * user_bet.bet_points ) + user_bet.bet_points
            elsif @bet.winner == 2
              user_bet.returned_value = ( (1 - @bet.team_two_chance / 100) * user_bet.bet_points ) + user_bet.bet_points
            end

            user_bet.exp_change = user_bet.bet_points / 4
            user_bet.save

            user.won_bets += 1;
            user.points += user_bet.returned_value
            user.experience += user_bet.exp_change

          else 
            user_bet.exp_change = -( user_bet.bet_points / 8 )
            user_bet.save
            user.lost_bets += 1;
            user.experience += user_bet.bet_points / 8;
          end

          user.save

          case user.experience
            when 100..300 then user.level = 1
            when 301..600 then user.level = 2
            when 601..1000 then user.level = 3
            when 1001..1700 then user.level = 4
            when 1701..3500 then user.level = 5
            when 3501..5000 then user.level = 6
            when 5001..7000 then user.level = 7
            when 7001..9500 then user.level = 8
            when 9501..11150 then user.level = 9
            when 11150..14000 then user.level = 10
          end
          user.save

        end # / users.each

      end # / if users_bets
     end # / user_bet.each

  end

  def finish
    @bet = Bet.find(params[:id])
    @user_bets = UserBet.all
    @users = User.all
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
      params.require(:bet).permit(:team_one, :team_two, :team_one_chance, :team_two_chance, :team_one_value, :team_two_value, :winner, :bets_on_team_one, :bets_on_team_two, :match_starts_at, :game, :bestof, :stream_link)
    end
end
