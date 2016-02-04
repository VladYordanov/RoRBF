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
  @user = current_user
  @user_bets = UserBet.all.order("created_at DESC").where(:user_id => @user.id)
  @deliveries = Delivery.all.order("created_at DESC").where(:user_id => @user.id);

  def calc_experience(end_points, start_points)
    @max_points_of_level = start_points.to_i
    return ( ( @user.experience - end_points ) * 100 ) / ( start_points - end_points )
  end

  case @user.experience
    when 0..300 then @level_percentage = calc_experience(0.0, 300.0)
    when 301..600 then @level_percentage = calc_experience(301.0, 600.0)
    when 601..1000 then @level_percentage = calc_experience(601.0, 1000.0)
    when 1001..1700 then @level_percentage = calc_experience(1001.0, 1700.0)
    when 1701..3500 then @level_percentage = calc_experience(1701.0, 3500.0)    
    when 3501..5000 then @level_percentage = calc_experience(3501.0, 5000.0)
    when 5001..7000 then @level_percentage = calc_experience(5001.0, 7000.0)
    when 7001..9500 then @level_percentage = calc_experience(7001.0, 9500.0)
    when 9501..11150 then @level_percentage = calc_experience(9501.0, 11150.0)
    when 11150..14000 then @level_percentage = calc_experience(11150.0, 14000.0)
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
