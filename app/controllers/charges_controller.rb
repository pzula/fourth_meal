class ChargesController < ApplicationController
  
  def new
    @order = current_user.orders.last
    @amount = @order.subtotal * 100
  end
  
  def create
   
    @order = current_user.orders.last
    @amount = @order.subtotal * 100
  
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
      flash.notice = "Your order is successfull"
      cookies.delete :order_id
      UserMailer.order_email(current_user, current_user.orders.last).deliver
    end
    redirect_to user_path(current_user)
  end  
end
