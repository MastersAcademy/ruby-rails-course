class WrongNumberError < StandardError

  def initialize(msg="Please choose cocktail from 1 to 4")
    super(msg)
  end
end

module Welcome
  attr_accessor :type

  def greeting(type)
    puts "================================="
    puts "Welcome to the #{type} cocktails bar!"
    puts "================================="
  end
end

module Guest
  attr_accessor :name, :drinks

  def initialize(name, drinks)
    @name = name
    @drinks = drinks
  end
end

class ClassicCocktailsBar
  include Welcome
  include Guest

  def run1

    begin
      puts "Hello i'm #{@name}, and i need some #{drinks}, what you can offer?"
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Mojito - 1\nCuba libre - 2\nBlack russian - 3\nGod father - 4\nMake your  choice: "
      choice = gets.to_i
      cocktails = {
          1 => {name: 'Mojito', recipe: "White rum - 50 ml,\nlime - 2 slices,\nmint - 15 gr.,\nsimple syrup - 20 gr."},
          2 => {name: 'Cuba libre', recipe: "Black rum - 50 ml\nCola - 150 ml\nFresh lime juice - 10 ml"},
          3 => {name: 'Black russian', recipe: "Vodka - 50 ml\nKahlua - 50 ml"},
          4 => {name: 'God father', recipe: "Scotch - 35 ml\nAmaretto - 35 ml"},
      }
      if (1..4).include?(choice)
        cocktail = cocktails[choice]
        cocktail.each{|key, value| puts key, value}
      else
        begin
          raise WrongNumberError.new
        rescue WrongNumberError => e
          p e.message
          p e.backtrace
        ensure
          puts "Enjoy the cocktail and try another recipe from classic cocktails!"
        end
      end
    end

  end
end

class NewEraBar
  include Welcome
  include Guest

  def run2

    begin
      puts "Hello i'm #{@name}, and i need some #{drinks}, what you can offer?"
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Bramble - 1\nFrench martini - 2\nSpritz veneziano - 3\nVesper - 4\nMake your choice: "
      choice = gets.to_i
      cocktails = {
          1 => {name: 'Bramble', recipe: "Gin - 40 ml,\nSugar syrup - 10 ml,\nFresh lemon juice - 15 ml.,\nBlackberry liqueur - 15 ml."},
          2 => {name: 'French martini', recipe: "Vodka - 45 ml\nRaspberry liqueur - 15 ml.\nFresh pineapple juice - 15 ml"},
          3 => {name: 'Spritz veneziano', recipe: "Prosseco - 60 ml\nAperol - 40 ml\nSplash of Soda water."},
          4 => {name: 'Vesper', recipe: "Gin - 60 ml\nVodka - 15 ml\nLillet Blonde - 7 ml."},
      }
      if (1..4).include?(choice)
        cocktail = cocktails[choice]
        cocktail.each{|key, value| puts key, value}
      else
        begin
          raise WrongNumberError.new
        rescue WrongNumberError => e
          p e.message
          p e.backtrace
        ensure
          puts "Enjoy the cocktail and try another recipe from classic cocktails!"
        end
      end
    end
  end
end





guest1 = ClassicCocktailsBar.new("John", "classic cocktails")
  guest1.greeting("Classic")
  guest1.run1

guest2 = NewEraBar.new("Bob", "modern cocktails")
  guest2.greeting("NewEra")
  guest2.run2
