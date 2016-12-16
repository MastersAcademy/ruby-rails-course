module ClassicCocktails

  def run1
    greeting

    begin
      puts "Here is a coctails, you can choose one and we show ingredients:"
      puts "Mojito - 1\nCuba libre - 2\nBlack russian - 3\nGod father - 4\n"
      puts "Make your  choice: "
      choice = gets.to_i
      cocktails = {
        1 => {name: 'Mojito', recipe: "White rum - 50 ml,\nlime - 2 slices,\nmint - 15 gr.,\nsimple syrup - 20 gr."},
        2 => {name: 'Cuba libre', recipe: "Black rum - 50 ml\nCola - 150 ml\nFresh lime juice - 10 ml"},
        3 => {name: 'Black russian', recipe: "Vodka - 50 ml\nKahlua - 50 ml"},
        4 => {name: 'God father', recipe: "Scotch - 35 ml\nAmaretto - 35 ml"},
      }
      cocktail = cocktails[choice]
      cocktail.each{|key, value| puts key, value}
    rescue NoMethodError
      puts "Please choose cocktail from 1 to 4"
    retry
    ensure
      puts "Enjoy the cocktail and try another recipe from In shaker!"
    end
  end

  def greeting
    puts "Welcome to the classic cocktails!"
  end
end

module NewEra

    def run2
      greeting

      begin
        puts "Here is a coctails, you can choose one and we show ingredients:"
        puts "Bramble - 1\nFrench martini - 2\nSpritz veneziano - 3\nVesper - 4\n"
        puts "Make your choice: "
        choice = gets.to_i
        cocktails = {
          1 => {name: 'Bramble', recipe: "Gin - 40 ml,\nSugar syrup - 10 ml,\nFresh lemon juice - 15 ml.,\nBlackberry liqueur - 15 ml."},
          2 => {name: 'French martini', recipe: "Vodka - 45 ml\nRaspberry liqueur - 15 ml.\nFresh pineapple juice - 15 ml"},
          3 => {name: 'Spritz veneziano', recipe: "Prosseco - 60 ml\nAperol - 40 ml\nSplash of Soda water."},
          4 => {name: 'Vesper', recipe: "Gin - 60 ml\nVodka - 15 ml\nLillet Blonde - 7 ml."},
        }
        cocktail = cocktails[choice]
        cocktail.each{|key, value| puts key, value}
      rescue NoMethodError
        puts "Please choose cocktail from 1 to 4"
      retry
      ensure
        puts "Enjoy the cocktail and try another recipe from In shaker!"
      end
    end

    def greeting
      puts "Welcome to the new era cocktails!"
    end

end

class InShaker 

  include ClassicCocktails
  extend NewEra
  def main

    begin
      puts "Welcome to the 'In shaker' programm!\nEnter - 1 for choose 'Classic cocktails' or 2 for 'New era cocktails'!"
      choice = gets.to_i
      case choice

      when 1
        run1
      when 2
        InShaker.run2
      else

        if [1,2].include? choiсe
          raise "Try again!"
        end
      end
    rescue StandardError
        puts "Oops you enter a wrong number,try again and choose 1 or 2!"
      retry
    end
  end
end

InShaker.new.main
