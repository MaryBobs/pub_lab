class Customer

attr_reader :name, :wallet

def initialize(name, wallet)
  @name = name
  @wallet = wallet
end

def pay_for_drink(drink)
  @wallet -= drink
end


end
