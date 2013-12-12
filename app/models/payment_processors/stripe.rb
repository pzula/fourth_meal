module PaymentProcessors
  class Stripe
    def self.process(email, token, amount)
      customer = ::Stripe::Customer.create(
        :email => email,
        :card  => token
      )
      begin
        charge = ::Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue ::Stripe::CardError => e
        [false, e.message]
      end
      [true, "Sucessfully charged"]
    end

    def self.render(amount) 
      %{<script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
          data-key="#{Rails.configuration.stripe[:publishable_key]}"
          data-description="Your Order"
          data-amount="#{ amount }"></script>}.html_safe 
    end
  end

end
