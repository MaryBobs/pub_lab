require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 3.90)
    @drink2 = Drink.new("Gin & Tonic", 4.50)
    @drink3 = Drink.new("Cranberry Juice", 1.50)
    @pub1 = Pub.new("CodeClan Arms", 100, [@drink1, @drink2, @drink3])

  end

def test_pub_has_name
  assert_equal("CodeClan Arms", @pub1.name)
end

def test_pub_till_has_money
  assert_equal(100, @pub1.till)
end

def test_pub_has_drinks
  assert_equal(3, @pub1.count_drinks)
end

def test_increase_money_in_till
  @pub1.add_money(@drink1.price)
  assert_equal(103.90, @pub1.till)
end

def test_remove_drink_from_pub
  @pub1.sell_drink(@drink1)
  assert_equal(2, @pub1.count_drinks)
end

def test_find_drink_by_name
  @pub1.find_drink("Gin & Tonic")
  assert_equal("Gin & Tonic", @drink2.name)
end

def test_sell_drink_to_customer
customer = Customer.new("Mary", 10)
@pub1.customer_buys_drink(@drink2, customer)
assert_equal(2, @pub1.count_drinks)
assert_equal(104.50, @pub1.till)
assert_equal(5.50, customer.wallet)
end








end
