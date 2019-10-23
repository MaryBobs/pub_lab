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

# def customer_buys_drink(drink, customer)
#   age_check(customer)
#   drunkenness_check(customer, drink)
#   add_money(drink.price)
#   sell_drink(drink)
#   customer.pay_for_drink(drink.price)
# end

def age_check(customer)
  if customer.age >= 18
    return "What would you like to drink?"
  else
    return "You're barred!"
  end
end

def drunkenness_check(customer, drink)
  total_alcohol = customer.drunkenness + drink.alcohol_level
  if total_alcohol >= 5
    return "Time to go home!"
  else
    return "What would you like to drink?"
  end
end

def customer_buys_drink(drink, customer)
  if age_check(customer) == "You're barred!"
    return "Go home!"
  elsif drunkenness_check(customer, drink) == "Time to go home!"
    return "Go home!"
  else
   sell_drink(drink)
   add_money(drink.price)
   customer.pay_for_drink(drink.price)
 end
end
# if age_check(customer) || drunkenness_check(customer, drink) == "Time to go home!"
#   return "Go home!"

end
