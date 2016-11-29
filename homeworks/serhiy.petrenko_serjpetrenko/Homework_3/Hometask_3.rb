class Ingregients
  attr_reader :set
  def initialize
    @set = {"Mojito" => 1, "Cuba libre" => 2 , "Black russian" => 3 , "Screwdriver" => 4}
  end
end

class In_shaker
  def initialize
    @ingredients = Ingregients.new
  end

  def run
    greeting

    begin
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Mojito - 1\nCuba libre - 2\nBlack russian - 3\nScrewdriver - 4\n"
      puts "Make your choice: "
      choice = gets.to_i

      case choice
        when 1
          selection = "Mojito"
          puts "Mojito: "
          puts "White rum - 50 ml,\nlime - 2 slices,\nmint - 15 gr.,\nsimple syrup - 20 gr."
          puts "Enjoy the cocktail!"
        when 2
          selection = "Cuba libre"
          puts "Cuba libre: "
          puts "Black rum - 50 ml\nCola - 150 ml\nFresh lime juice - 10 ml"
          puts "Enjoy the cocktail!"
        when 3
          selection = "Black russian"
          puts "Black russian: "
          puts "Vodka - 50 ml\nKahlua - 50 ml"
          puts "Enjoy the cocktail!"
        when 4
          selection = "Screwdriver"
          puts "Screwdriver: "
          puts "Vodka - 50 ml\nOrange juice - 150 ml"
          puts "Enjoy the cocktail!"
        else
          selection = "Unknown"
          puts "There is no such kind of cocktails. Please try again!"
          puts "Enjoy the cocktail!"
      end
    end while selection == "Unknown"
  end

  def greeting
    puts "Welcome to the In shaker programm!"
  end
end


In_shaker.new.run

