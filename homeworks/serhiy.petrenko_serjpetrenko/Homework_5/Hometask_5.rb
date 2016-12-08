module Ingredients_classic
  attr_accessor :set
  def initialize
    @set1 = {"Mojito": 1, "Cuba libre": 2 , "Black russian": 3 , "Screwdriver": 4}
  end
end

module Classic_cocktails
  def initialize
    @ingredients_classic = Ingredients_classic
  end

  def run1
    greeting

    begin
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Mojito - 1\nCuba libre - 2\nBlack russian - 3\nGod father - 4\n"
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
          selection = "God father"
          puts "God father: "
          puts "Scotch - 35 ml\nAmaretto - 35 ml"
          puts "Enjoy the cocktail!"
        else
          selection = "Unknown"
          puts "There is no such kind of cocktails. Please try again!"
          puts "Enjoy the cocktail!"
      end
    end while selection == "Unknown"
  end

  def greeting
    puts "Welcome to the classic cocktails!"
  end
end

module Ingredients_new_era

  attr_accessor :set

  def initialize
    @set2 = {"Bramble": 1, "French martini": 2, "Spritz veneziano": 3, "Vesper": 4}
  end

end

module New_era

    def initialize
      @ingredients_new_era = Ingredients_new_era
    end

    def run2
      greeting

      begin
        puts "Here is a coctails, you can choose one and we show ingredients:"
        puts "Bramble - 1\nFrench martini - 2\nSpritz veneziano - 3\nVesper - 4\n"
        puts "Make your choice: "
        choice = gets.to_i

        case choice
          when 1
            selection = "Bramble"
            puts "Bramble: "
            puts "Gin - 40 ml,\nSugar syrup - 10 ml,\nFresh lemon juice - 15 ml.,\nBlackberry liqueur - 15 ml."
            puts "Enjoy the cocktail!"
          when 2
            selection = "French martini"
            puts "French martini: "
            puts "Vodka - 45 ml\nRaspberry liqueur - 15 ml.\nFresh pineapple juice - 15 ml"
            puts "Enjoy the cocktail!"
          when 3
            selection = "Spritz veneziano"
            puts "Spritz veneziano: "
            puts "Prosseco - 60 ml\nAperol - 40 ml\nSplash of Soda water."
            puts "Enjoy the cocktail!"
          when 4
            selection = "Vesper"
            puts "Vesper: "
            puts "Gin - 60 ml\nVodka - 15 ml\nLillet Blonde - 7 ml."
            puts "Enjoy the cocktail!"
          else
            selection = "Unknown"
            puts "There is no such kind of cocktails. Please try again!"
            puts "Enjoy the cocktail!"
        end
      end while selection == "Unknown"
    end

    def greeting
      puts "Welcome to the new era cocktails!"
    end

end


class In_shaker

  include Ingredients_classic
  include Classic_cocktails
  include Ingredients_new_era
  include New_era

  def main
    begin
      puts "Welcome to the 'In shaker' programm!"
      puts "Enter - 1 for choose 'Classic cocktails' or 2 for 'New era cocktails'!"
      choice = gets.to_i
      case choice

      when 1
        run1
      when 2
        run2
      end

    end
  end
end

In_shaker.new.main
