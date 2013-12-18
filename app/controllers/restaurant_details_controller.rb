class RestaurantDetailsController < ApplicationController
  before_action :set_restaurant_detail, only: [:show, :edit, :update, :destroy]

  def index
    @restaurant_details = RestaurantDetail.all
  end

  def show
  end

  def new
    @restaurant_detail = RestaurantDetail.new
  end

  def edit
  end

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

  def destroy
    @restaurant_detail.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_details_url }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant_detail
      @restaurant_detail = RestaurantDetail.find(params[:id])
    end

    def restaurant_detail_params
      params.require(:restaurant_detail).permit(:phone, :street, :street2, :city, :state, :zip, :description, :hours_id, :delivery, :delivery_range)
    end
end
