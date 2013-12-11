module OrdersHelper

  require 'securerandom'

  def generate_unique_url
    SecureRandom.hex
  end

end
