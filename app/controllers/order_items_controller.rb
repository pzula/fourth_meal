class OrderItemsController < ApplicationController
  include OrderItemsHelper
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    if order_item.quantity <= 0
      destroy
    else
      order = Order.find(order_item.order_id)
      redirect_to order_path(order)
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order_id)
    order_item.destroy
    redirect_to order_path(order)
  end
end
