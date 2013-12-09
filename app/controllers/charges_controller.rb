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
        :email => 'example@stripe.com',
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
      flash.notice = "Your order was successful"
    end
  end

  private

  def self.charge_customer

  end

  def self.save_addresses
    # Generate a migration for an addresses table
    # Feed the params into that table
    # Add a migration for address table to be added to order
    # New up an address, and set the order to hold the address id
  end


end
