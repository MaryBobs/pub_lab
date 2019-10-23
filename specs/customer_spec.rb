require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")
require_relative("../drink.rb")

class TestCustomer < MiniTest::Test

def setup

@customer1 = Customer.new("Mary", 10)
@customer2 = Customer.new("Adam", 15)

@drink1 = Drink.new("Beer", 3.90)
@drink2 = Drink.new("Gin & Tonic", 4.50)
@drink3 = Drink.new("Cranberry Juice", 1.50)

end

def test_customer_has_name
  assert_equal("Mary", @customer1.name)
end

def test_wallet_has_cash
  assert_equal(15, @customer2.wallet)
end

def test_remove_money_from_wallet
  @customer1.pay_for_drink(@drink1.price)
  assert_equal(6.10, @customer1.wallet)
end

end
