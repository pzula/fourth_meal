require "test_helper"

class TransactionTest < ActiveSupport::TestCase

  test "a transaction is invaild without a total" do
    trans = Transaction.new
    refute trans.save
  end
end
