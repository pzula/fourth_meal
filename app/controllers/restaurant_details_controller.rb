class RestaurantDetailsController < ApplicationController
  before_action :set_restaurant_detail, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_details
  # GET /restaurant_details.json
  def index
    @restaurant_details = RestaurantDetail.all
  end

  # GET /restaurant_details/1
  # GET /restaurant_details/1.json
  def show
  end

  # GET /restaurant_details/new
  def new
    @restaurant_detail = RestaurantDetail.new
  end

  # GET /restaurant_details/1/edit
  def edit
  end

  # POST /restaurant_details
  # POST /restaurant_details.json
  def create
    @restaurant_detail = RestaurantDetail.new(restaurant_detail_params)

    respond_to do |format|
      if @restaurant_detail.save
        format.html { redirect_to @restaurant_detail, notice: 'Restaurant detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_details/1
  # PATCH/PUT /restaurant_details/1.json
  def update
    respond_to do |format|
      if @restaurant_detail.update(restaurant_detail_params)
        format.html { redirect_to @restaurant_detail, notice: 'Restaurant detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_details/1
  # DELETE /restaurant_details/1.json
  def destroy
    @restaurant_detail.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_detail
      @restaurant_detail = RestaurantDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_detail_params
      params.require(:restaurant_detail).permit(:phone, :street, :street2, :city, :state, :zip, :description, :hours_id, :delivery, :delivery_range)
    end
end
