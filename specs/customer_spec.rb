require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")
require_relative("../drink.rb")

class TestCustomer < MiniTest::Test

def setup

@customer1 = Customer.new("Mary", 10, 17, 0)
@customer2 = Customer.new("Adam", 15, 20, 3)

@drink1 = Drink.new("Beer", 3.90, 3)
@drink2 = Drink.new("Gin & Tonic", 4.50, 4)
@drink3 = Drink.new("Cranberry Juice", 1.50, 0)

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

def test_customer_age
  assert_equal(17, @customer1.age)
end

def test_level_of_drunkenness
  assert_equal(0, @customer1.drunkenness)
end

def test_consume_drink
  @customer1.consume_drink(@drink1.alcohol_level)
  assert_equal(3, @customer1.drunkenness)
end

end
