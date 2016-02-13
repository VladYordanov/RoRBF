class DeliveriesController < ApplicationController
    before_action :set_delivery, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_admin!, except: [:create, :buy, :new]

    # GET /deliveries
    # GET /deliveries.json
    def index
        @deliveries = Delivery.all
    end

    # GET /deliveries/1
    # GET /deliveries/1.json
    def show
    end

    # GET /deliveries/new
    def new
        @delivery = Delivery.new
        @prize = Prize.find(params[:prize_id])

        @delivery.user_id = current_user.id
        @delivery_user_username = current_user.username 
        @delivery.prize_id = @prize.id
    end

    # GET /deliveries/1/edit
    def edit
    end

    # POST /deliveries
    # POST /deliveries.json
    def create
      @delivery = Delivery.new(delivery_params)
      @prize = Prize.find(params[:prize_id])
      @user = current_user

   
      respond_to do |format|
        if @delivery.save

            @delivery.create_delivery(@prize, @user)

            format.html { redirect_to @delivery, notice: 'Delivery was successfully created.' }
            format.json { render :show, status: :created, location: @delivery }
        else
            format.html { render :new }
            format.json { render json: @delivery.errors, status: :unprocessable_entity }
        end
      end

    end

    # PATCH/PUT /deliveries/1
    # PATCH/PUT /deliveries/1.json
    def update
      respond_to do |format|
        if @delivery.update(delivery_params)
          format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
          format.json { render :show, status: :ok, location: @delivery }
        else
          format.html { render :edit }
          format.json { render json: @delivery.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /deliveries/1
    # DELETE /deliveries/1.json
    def destroy
      @delivery.destroy
      respond_to do |format|
        format.html { redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def buy
      @prize = Prize.find(params[:id])
      @user = current_user
      @prize.in_stock -= 1
      @prize.save
      
      respond_to do |format|
        format.html { redirect_to prizes_url, notice: 'You have bought this prize'}
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_delivery
        @delivery = Delivery.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def delivery_params
        params.require(:delivery).permit(:user_id, :street, :state, :country, :zipcode, :first_last_name, :phone_number, :address_continued, :user_email)
      end
end
