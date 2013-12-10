class OrderDetailsController < ApplicationController

  def new

  end

  def create
    OrderDetail.new(order_detail_params)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:first_name, :last_name, :email, :phone, :delivery_street, :delivery_address_2, :delivery_city, :delivery_state, :delivery_zip, :billing_street, :billing_address_2, :billing_city, :billing_state, :billing_zip)
  end
end
