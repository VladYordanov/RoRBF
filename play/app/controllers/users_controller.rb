class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_admin!, except: [:bets, :profile]
  #before_filter :authenticate_user!, only: [:bets, :profile]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def bets
  @user = current_user
  @user_bets = @user.user_bets.all
end

def profile
  if current_user
    @user = current_user
    @user_bets = UserBet.all.order("created_at DESC").where(:user_id => @user.id)
    @deliveries = Delivery.all.order("created_at DESC").where(:user_id => @user.id)

    case @user.experience
    when 0..300 then @level_percentage = @user.calc_experience(0.0, 300.0)
    when 301..600 then @level_percentage = @user.calc_experience(301.0, 600.0)
    when 601..1000 then @level_percentage = @user.calc_experience(601.0, 1000.0)
    when 1_001..1_700 then @level_percentage = @user.calc_experience(1_001.0, 1_700.0)
    when 1_701..3_500 then @level_percentage = @user.calc_experience(1_701.0, 3_500.0)
    when 3_501..5_000 then @level_percentage = @user.calc_experience(3_501.0, 5_000.0)
    when 5_001..7_000 then @level_percentage = @user.calc_experience(5_001.0, 7_000.0)
    when 7_001..9_500 then @level_percentage = @user.calc_experience(7_001.0, 9_500.0)
    when 9_501..11_150 then @level_percentage = @user.calc_experience(9_501.0, 11_150.0)
    when 11_150..14_000 then @level_percentage = @user.calc_experience(11_150.0, 14_000.0)
    end
  end

end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_username(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :points, :all_bets, :curr_bets, :won_bets, :lost_bets)
    end


end
