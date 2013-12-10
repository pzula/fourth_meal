class ChargesController < ApplicationController

  def new
    @order = current_user.orders.last
    @amount = @order.subtotal * 100
  end

  def create
    @order_id = cookies[:order_id]
    @order = Order.find(@order_id)
    @amount = @order.subtotal * 100

    if current_user
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
      )
      begin
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount.to_i,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue Stripe::CardError => e
        flash[:error] = e.message
      else
        current_user.change_order_to_completed
        flash.notice = "Your order was successful"
        cookies.delete :order_id
        UserMailer.order_email(current_user, current_user.orders.last).deliver
      end
      redirect_to user_path(current_user)
    else
      save_addresses
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
      )
      begin
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount.to_i,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue Stripe::CardError => e
        flash[:error] = e.message
      else
        #current_user.change_order_to_completed
        flash.notice = "Your order was successful"
        cookies.delete :order_id
        #UserMailer.order_email(current_user, current_user.orders.last).deliver
      end
    end
  end

  private

  def order_params
    params.require(:order_detail).permit(:first_name, :last_name, :email, :phone, :delivery_street, :delivery_address_2, :delivery_city, :delivery_state, :delivery_zip, :billing_street, :billing_address_2, :billing_city, :billing_state, :billing_zip)
  end

  def save_addresses
    @details = OrderDetail.create(order_params)
  end
end
