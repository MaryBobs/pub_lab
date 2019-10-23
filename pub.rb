class Pub

attr_reader :name, :till

def initialize(name, till, drinks)
  @name = name
  @till = till
  @drinks = drinks
end

def count_drinks
  return @drinks.size()
end

def add_money(money)
  @till += money
end

def sell_drink(drink)
  @drinks.delete(drink)
end

def find_drink(name)
  for drink_name in @drinks
    if drink_name == name
     end
    return drink_name
  end
end

def customer_buys_drink(drink, customer)
  add_money(drink.price)
  sell_drink(drink)
  customer.pay_for_drink(drink.price)
end


end
