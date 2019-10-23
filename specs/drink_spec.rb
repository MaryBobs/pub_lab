require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

class TestDrink < MiniTest::Test

def setup

  @drink1 = Drink.new("Beer", 3.90, 3)
  @drink2 = Drink.new("Gin & Tonic", 4.50, 4)
  @drink3 = Drink.new("Cranberry Juice", 1.50, 0)

end

def test_drink_has_name
  assert_equal("Beer", @drink1.name)
end

def test_drink_has_price
  assert_equal(3.90, @drink1.price)
end

def test_drink_alcohol_level
  assert_equal(3, @drink1.alcohol_level)
end











end
