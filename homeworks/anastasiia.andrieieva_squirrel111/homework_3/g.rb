

class Garden
attr_reader :length, :width
  def initialize(length, width)
    @length, @width = length, width
  end

  def hello
    puts "Привет, я вскопаный огород, ждущий посадки.Мои параметры: "
  end
end

gargen = Garden.new("10m","10m")
  puts gargen.hello
  puts gargen.length
  puts gargen.width

class Seedling
attr_accessor :colour, :stem_lenght, :root_lenght
  def initialize(colour = "green", stem_lenght = "10cm", root_lenght = "5cm")
    @colour, @stem_lenght, @root_lenght = colour, stem_lenght, root_lenght
  end  

  def hello
    puts "Я - рассада! Посади меня!"
  end

  def Seedling.factory(sg)
    { :Paprica => Paprica, :Tomato => Tomato }[sg].new
  end
end

seedling = Seedling.new("цвет = зелёный", "стебель = 10-15cm", "корень = 5-10см")
  puts seedling.colour
  puts seedling.stem_lenght
  puts seedling.root_lenght
  puts seedling.hello


class Paprica < Seedling

  def identification 
    puts "Я выросту и буду сладким перчиком!"
  end
end

paprica = Paprica.new
puts paprica.hello
puts paprica.identification


class Tomato < Seedling

  def identification 
    puts "Я выросту и буду сочным томатом!"
  end
end

tomato = Tomato.new
puts tomato.hello
puts tomato.identification

