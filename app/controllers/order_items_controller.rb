class OrderItemsController < ApplicationController
  include OrderItemsHelper
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    order = Order.find(order_item.order_id)
    redirect_to order_path(order)
  end
end
