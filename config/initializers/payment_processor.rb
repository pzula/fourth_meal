if Rails.env.production? || Rails.env.staging?
  PAYMENT_PROCESSOR = PaymentProcessors::Stripe
else
  PAYMENT_PROCESSOR = PaymentProcessors::Stub
end
