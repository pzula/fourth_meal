class OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])

    if order_item.update(order_item_params)
      redirect_to order_item.order, notice: 'Your item was updated.'
    else
      redirect_to order_item.order, alert: 'There was an error.'
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order_id)
    order_item.destroy
    redirect_to order_path(order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end

end
