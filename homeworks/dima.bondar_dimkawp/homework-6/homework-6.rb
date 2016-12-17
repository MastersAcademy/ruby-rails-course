module FactorySize

  attr_accessor :size

  def size_ball(size)

    raise ArgumentError.new("Rep must be positive Integer") unless size.respond_to?(:to_i) && size.to_i>0

    case size
      when 1 .. 2
        p 'little size'
      when 3 .. 4
        p 'midle size'
      when 5 .. 6
        p 'big size'
      else
        size = 5
        p 'default size 5'
    end
    p
    p "SizeBall    - #{size}"
    p '__________________________'
  end

end

module FactoryTextile

  attr_accessor :textile

  def textile_ball(textile)

    case textile
      when 'Composite leather'
        p 'Composite leather'
      when 'Microfiber'
        p 'Microfiber '
      when 'Polyurethane'
        p 'Polyurethane'
      when 'Rubber'
        p 'Rubber'
      else
        'Polyurethane default textile'
        puts 'default textile'
    end

    p "TextileBall - #{textile}"
    p '__________________________'

  end

end

module FactoryColor

  attr_accessor :color

  def color_ball(color)

    case color
      when 'RED'
        puts 'color RED'
      when 'Green'
        puts 'color Green'
      when 'Yellow'
        puts 'color Yellow'
      when 'Yellow'
        puts 'color Withe'
      else
        color = 'Withe'
        puts 'Withe default color'
    end

    p "ColorBall    -#{color}"
    p '__________________________'
  end
end

module FactoryWeigh

  attr_accessor :weigh

  def weigh_ball(weigh)

    raise ArgumentError.new("Rep must be positive Integer >200 or <500") unless weigh.respond_to?(:to_i) && weigh.to_i>=200 && weigh.to_i<=500

    case weigh
      when 200 .. 300
        puts 'weigh Easy'
      when 300 .. 400
        puts 'weigh Everagy'
      when 400 .. 500
        puts 'weigh Heavy'
      else
        weigh = 350
        puts 'weigh default Everagy'
    end

    p "WeighBall    - #{weigh}"
    p '__________________________'

  end
end

module NameAdd

  def ball_name(name='default name')

    name_check = ['Nike','Adidas','Reebok']

    if name_check.include?(name) == true
      brand = 'Brand *'
      p "Ball name - #{name} - #{brand}"
    else
      p "Ball name - #{name}"
    end

  end

end

module Unique

  def unique_def
    p 'unique'
  end

end

module TypeCheck

  attr_accessor :types

  def type_ball(type)

    if types.include?(type) == true
      p type
    else
      p 'type error'
    end

  end

end

class SoccerBall

  extend NameAdd
  extend Unique
  include FactorySize
  include FactoryColor
  include FactoryTextile
  include FactoryWeigh
  include TypeCheck

  def initialize
    @weigh = weigh
    @size = size
    @types = ['Soccer','soccer','Soccer-Ball']
  end

end

class BasketBall

  include FactorySize
  include FactoryColor
  include FactoryTextile
  include FactoryWeigh
  include TypeCheck

  def initialize
    @types = ['BasketBall','basketball','Basket-Ball']
  end

end

class ValleyBall

  extend NameAdd
  include FactorySize
  include FactoryColor
  include FactoryTextile
  include FactoryWeigh

  def initialize
    @types = ['ValleyBall','valleyball','Vally-Ball']
  end

end

# Builder

soccer_ball = SoccerBall.new
begin
soccer_ball.unique_def
rescue NoMethodError
  include Unique
else
  p "If no exception, include module"
ensure
  p "Unique is include"
end
soccer_ball.unique_def
soccer_ball.type_ball('soccer')
SoccerBall.ball_name()
soccer_ball.size_ball(1)
soccer_ball.textile_ball('12')
soccer_ball.color_ball('default')
soccer_ball.weigh_ball(200)
p '=========================='


basket_ball = BasketBall.new
begin
basket_ball.ball_name
rescue NoMethodError
  include NameAdd
else
  p "If no exception, include module"
ensure
  p "Module NameAdd is include"

end
basket_ball.type_ball('default')
BasketBall.ball_name('default')
basket_ball.size_ball(1)
basket_ball.color_ball('default')
basket_ball.weigh_ball(322)
p '=========================='

vally_ball = ValleyBall.new
begin
  vally_ball.type_ball('valleyball')
rescue NoMethodError
  include TypeCheck
else
  p "If no exception, include module"
ensure
  p "module TypeCheck is include"
end
vally_ball.type_ball('Vally-Ball')
ValleyBall.ball_name('default')
vally_ball.size_ball(3)
vally_ball.color_ball('default')
vally_ball.weigh_ball(450)
p '=========================='