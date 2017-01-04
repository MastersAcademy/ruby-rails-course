#
# Base construction project
#
class Drink
  attr_accessor :milk, :chocolate, :coffe
end

#
# Builder
#
class BuilderDrink
  attr_reader :drink

  def create_new_drink
    @drink = Drink.new
  end

  def get_drink
    "Your chose Americano with Milk. Beverage ingredients: coffe: #{@drink.coffe}, milk: #{@drink.milk}, chocolate: #{@drink.chocolate}"
  end
end

#
# BuilderConcret - Americano with Milk
#
class BuilderAmericanoMilk < BuilderDrink
  def build_coffe
    @drink.coffe = 'Americano'
  end

  def build_milk  
    @drink.milk = 'normal'
  end

  def build_chocolate
    @drink.chocolate = 'hot'
  end 
end

#
# BuilderConcret - Hot Chocolate
#
class BuilderHotChocolate < BuilderDrink
  def build_coffe
    @drink.coffe = 'Coffe'
  end

  def build_milk
   @drink.milk = 'normal'
  end

  def build_chocolate
    @drink.chocolate = 'hot'
  end
end

#
# Director - Managing a class that starts construction
#
class Waiter
  def set_builder_drink(bp)
    @builder_drink = bp
  end

  def get_drink
    @builder_drink.get_drink
  end

  def construct_drink
    @builder_drink.create_new_drink
    @builder_drink.build_coffe
    @builder_drink.build_milk
    @builder_drink.build_chocolate
   
  end  
end

waiter = Waiter.new

builder_americano_milk = BuilderAmericanoMilk.new
builder_hot_chocolate  = BuilderHotChocolate.new

waiter.set_builder_drink(builder_americano_milk)
waiter.construct_drink

puts waiter.get_drink