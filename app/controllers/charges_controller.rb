class ChargesController < ApplicationController

  def new
    @order = current_order
    @amount = (@order.subtotal * 100).to_i
  end

  def create
    current_order.items.each do |item|
      order_id = current_order.id
      restaurant_id = item.restaurant_id
      OrderRestaurant.create(order_id: order_id, restaurant_id: restaurant_id)
    end
    @order = current_order
    @amount = (@order.subtotal * 100).to_i

    if current_user
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
      )

      begin
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue Stripe::CardError => e
        flash[:error] = e.message
      else
        current_user.change_order_to_completed
        flash.notice = "Your order was successful"
        create_order
        UserMailer.order_email(current_user, current_user.orders.last).deliver
      end

      redirect_to user_path(current_user)
    else

     # if @details.invalid?
     #   @order_id = cookies[:order_id]
     #   @order = Order.find(@order_id)
     #   @items = @order.items
     #   # puts @details.errors.inspect
     #   render "orders/guest_checkout" and return
     # end

      payment_success, message =  PAYMENT_PROCESSOR.process(params[:stripeEmail], params[:stripeToken], @amount)
      if payment_success
        #current_user.change_order_to_completed
        flash.notice = "Your order was successful"
        @order.status = "paid"
        @order.order_details_id = save_addresses.id
        @order.save
        UserMailer.guest_email(params[:stripeEmail], Order.find(current_order)).deliver
        @order = create_order
      else
        # flash error
        # render redirect
      end
    end
  end

  private

  def order_params
    params.require(:order_detail).permit(:first_name, :last_name, :email, :phone, :delivery_street, :delivery_address_2, :delivery_city, :delivery_state, :delivery_zip)
  end

  def save_addresses
    OrderDetail.create(order_params)
  end
end
