module Greeting
  def greeting
    puts "Hello! I'm a Food Machine.
    I can give you some food but it's not for free."
  end
end

module Food
  def Food.food_set
    set = {"Cookies" => 3, "Cruasans" => 5, "Juice" => 5, "Water" => 1}
  end
end

module MoneyAccounter
  attr_accessor :balance
  def initialize(balance=0)
    @balance = balance
  end
end

puts "------------------------------------------------"

class Hello
  include Greeting
end

class PrintPrice
  include Food

  puts "Here is price table:"
  puts "******************"
  i = 1
  Food.food_set.each do |key, value|
    print i, ". ", key, " - ", value, "$\n"
    i += 1
  end
  puts "******************"

end

class FoodMachine
  include Food
  extend MoneyAccounter

  def select_food

    num_food = {1 => "Cookies", 2 => "Cruasans" , 3 => "Juice" , 4 => "Water"}
    begin
      puts "Make your choice: "
      choice = gets.to_i

      selection = num_food[choice]
      if (selection == nil)
        puts "There is no such kind of foods. Please look carefully!"
      end

    end while !selection
    return selection
  end

  def check_price(selection)
    price = Food.food_set[selection]
    begin
      print "Your selection - ", selection, "\n"
      print "Give me ", price, "$\n"

      money = gets.to_i
      if money != price
        rejected = true
        puts "Rejected!"
        puts "Put the correct amount of money"
      else
        rejected = false
        FoodMachine.balance = money
        print "Take your ", selection, "\n"
        puts "Enjoy!"
      end
    end while rejected
  end
end

Hello.new
PrintPrice.new
fm = FoodMachine.new
selection = fm.select_food
fm.check_price(selection)
