module PaymentProcessors
  class Stub
    def self.process(email, token, amount)
      [true, "Successfully charged"]
    end

    def self.render(amount)
      '<input type="submit">'.html_safe
    end
  end

end
