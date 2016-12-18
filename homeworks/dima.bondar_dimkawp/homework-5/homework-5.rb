module FactorySize

  attr_accessor :size

  def size_ball(size)
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
    @types = ['Soccer','soccer','Soccer-Ball']
  end

end

class BasketBall

  extend NameAdd
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
  include TypeCheck

  def initialize
    @types = ['ValleyBall','valleyball','Vally-Ball']
  end

end

# Builder

SoccerBall.unique_def
soccer_ball = SoccerBall.new
soccer_ball.type_ball('soccer')
SoccerBall.ball_name()
soccer_ball.size_ball('default')
soccer_ball.textile_ball('12')
soccer_ball.color_ball('default')
soccer_ball.weigh_ball('default')
p '__________________________'
basket_ball = BasketBall.new
basket_ball.type_ball('default')
BasketBall.ball_name('default')
basket_ball.size_ball('default')
basket_ball.color_ball('default')
basket_ball.weigh_ball('default')
p '__________________________'
vally_ball = ValleyBall.new
vally_ball.type_ball('Vally-Ball')
ValleyBall.ball_name('default')
vally_ball.size_ball('default')
vally_ball.color_ball('default')
vally_ball.weigh_ball('default')
