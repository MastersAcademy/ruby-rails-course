module Welcome
  attr_accessor :type

  def greeting(type)
    puts "================================="
    puts "Welcome to the #{type} cocktails!"
    puts "================================="
  end
end

module ClassicCocktails
  def ClassicCocktails.cc_set
    cocktails = {
      1 => {name: 'Mojito', recipe: "White rum - 50 ml,\nlime - 2 slices,\nmint - 15 gr.,\nsimple syrup - 20 gr."},
      2 => {name: 'Cuba libre', recipe: "Black rum - 50 ml\nCola - 150 ml\nFresh lime juice - 10 ml"},
      3 => {name: 'Black russian', recipe: "Vodka - 50 ml\nKahlua - 50 ml"},
      4 => {name: 'God father', recipe: "Scotch - 35 ml\nAmaretto - 35 ml"},
    }
  end
end

module NewEra
  def NewEra.ne_set
    cocktails = {
      1 => {name: 'Bramble', recipe: "Gin - 40 ml,\nSugar syrup - 10 ml,\nFresh lemon juice - 15 ml.,\nBlackberry liqueur - 15 ml."},
      2 => {name: 'French martini', recipe: "Vodka - 45 ml\nRaspberry liqueur - 15 ml.\nFresh pineapple juice - 15 ml"},
      3 => {name: 'Spritz veneziano', recipe: "Prosseco - 60 ml\nAperol - 40 ml\nSplash of Soda water."},
      4 => {name: 'Vesper', recipe: "Gin - 60 ml\nVodka - 15 ml\nLillet Blonde - 7 ml."},
    }
  end
end

class InShakerClassic
  include Welcome
  extend ClassicCocktails

  def run1
    begin
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Mojito - 1\nCuba libre - 2\nBlack russian - 3\nGod father - 4\n"
      puts "Make your  choice: "
      choice = gets.to_i
      cocktail = ClassicCocktails.cc_set[choice]
      cocktail.each{|key, value| puts key, value}
    rescue NoMethodError
      puts "Please choose cocktail from 1 to 4"
    retry
    ensure
      puts "Enjoy the cocktail and try another recipe from classic cocktails!"
    end
  end
end

class InShakerNewEra
  include Welcome
  extend NewEra

  def run2
    begin
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Bramble - 1\nFrench martini - 2\nSpritz veneziano - 3\nVesper - 4\n"
      puts "Make your choice: "
      choice = gets.to_i
      cocktail = NewEra.ne_set[choice]
      cocktail.each{|key, value| puts key, value}
    rescue NoMethodError
      puts "Please choose cocktail from 1 to 4"
    retry
    ensure
      puts "Enjoy the cocktail and try another recipe from New era cocktails!"
    end
  end
end


InShakerClassic.new.greeting("classic")
InShakerClassic.new.run1
InShakerNewEra.new.greeting("new era")
InShakerNewEra.new.run2
