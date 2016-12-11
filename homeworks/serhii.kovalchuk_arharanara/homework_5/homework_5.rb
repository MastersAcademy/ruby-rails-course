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

class FoodMachine

  include Food
  extend MoneyAccounter

  def run
    greeting

    begin
      puts "Here is price table:"
      print_price
      puts "Make your choice: "
      choice = gets.to_i

      case choice
        when 1
          selection = "Cookies"
        when 2
          selection = "Cruasans"
        when 3
          selection = "Juice"
        when 4
          selection = "Water"
        else
          selection = "Unknown"
          puts "There is no such kind of foods. Please look carefully!"
      end
    end while selection == "Unknown"

    price = Food.food_set[selection]
    #Food::set

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

  def greeting
    puts "Hello! I'm a Food Machine.
I can give you some food but it's not for free."
  end

  def print_price
    i = 1
    Food.food_set.each do |key, value|
      print i, ". ", key, " - ", value, "$\n"
      i += 1
    end
  end
end

FoodMachine.new.run
