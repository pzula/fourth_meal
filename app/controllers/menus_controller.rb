class MenusController < ApplicationController

  def index
    redirect_to new_order_path unless cookies[:order_id]
    @restaurant = params[:restaurant]
    #find_by_slug
    @menu = Menu.new
    if cookies[:order_id] 
      @order = Order.find(cookies[:order_id])
    end
  end

end
