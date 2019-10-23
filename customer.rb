class Customer

attr_reader :name, :wallet, :age, :drunkenness

def initialize(name, wallet, age, drunkenness)
  @name = name
  @wallet = wallet
  @age = age
  @drunkenness = drunkenness
end

def pay_for_drink(drink)
  @wallet -= drink
end

def consume_drink(drink)
  @drunkenness += drink
end


end
