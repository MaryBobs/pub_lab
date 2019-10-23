require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")

class TestCustomer < MiniTest::Test

def setup

@customer1 = Customer.new("Mary", 10)
@customer2 = Customer.new("Adam", 15)

end

def test_customer_has_name
  assert_equal("Mary", @customer1.name)
end

def test_wallet_has_cash
  assert_equal(15, @customer2.wallet)
end

end
