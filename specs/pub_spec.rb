require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 3.90, 3)
    @drink2 = Drink.new("Gin & Tonic", 4.50, 4)
    @drink3 = Drink.new("Cranberry Juice", 1.50, 0)
    @pub1 = Pub.new("CodeClan Arms", 100, [@drink1, @drink2, @drink3])

    @customer1 = Customer.new("Mary", 15, 17, 0)
    @customer2 = Customer.new("Adam", 15, 20, 3)
    @customer3 = Customer.new("Bill", 15, 29, 0)
    @customer4 = Customer.new("Paul", 15, 16, 4)

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

# def test_sell_drink_to_customer
# @pub1.customer_buys_drink(@drink2, @customer1)
# assert_equal(2, @pub1.count_drinks)
# assert_equal(104.50, @pub1.till)
# assert_equal(10.50, @customer1.wallet)
# end

def test_check_customer_age__pass
  assert_equal("What would you like to drink?", @pub1.age_check(@customer2))
end

def test_check_customer_age__underage
  assert_equal("You're barred!", @pub1.age_check(@customer1))
end

def test_check_customer_drunkenness__pass
  assert_equal("What would you like to drink?", @pub1.drunkenness_check(@customer1, @drink1))
end

def test_check_customer_drunkenness__fail
  assert_equal("Time to go home!", @pub1.drunkenness_check(@customer2, @drink1))
end

def test_sell_drink_to_customer__pass
@pub1.customer_buys_drink(@drink2, @customer3)
assert_equal(2, @pub1.count_drinks)
assert_equal(104.50, @pub1.till)
assert_equal(10.50, @customer3.wallet)
end

def test_sell_drink_to_customer__underage
@pub1.customer_buys_drink(@drink2, @customer1)
assert_equal(3, @pub1.count_drinks)
assert_equal(100, @pub1.till)
assert_equal(15, @customer1.wallet)
end

def test_sell_drink_to_customer__drunk
@pub1.customer_buys_drink(@drink2, @customer2)
assert_equal(3, @pub1.count_drinks)
assert_equal(100, @pub1.till)
assert_equal(15, @customer2.wallet)
end

def test_sell_drink_to_customer__underage_and_drunk
@pub1.customer_buys_drink(@drink2, @customer4)
assert_equal(3, @pub1.count_drinks)
assert_equal(100, @pub1.till)
assert_equal(15, @customer4.wallet)
end


end
