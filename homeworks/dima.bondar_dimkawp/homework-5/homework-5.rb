module FactoryBall

  attr_accessor :size, :textile, :color, :weigh

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
    p '_______________________'
  end

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
    p '_______________________'
  end

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
    p '_______________________'
  end

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
    p '_______________________'

  end

end

module Ball_Name

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

class SoccerBall

  extend Ball_Name
  include FactoryBall

  def type_ball(type)

    type_check = ['Soccer','Basketball','Volleyball']

    if type_check.include?(type) == true
      p type
    else
      p 'type error'
    end
  end

end

soccer_ball = SoccerBall.new

soccer_ball.type_ball('soccer')
SoccerBall.ball_name()
soccer_ball.size_ball('default')
soccer_ball.textile_ball('default')
soccer_ball.color_ball('default')
soccer_ball.weigh_ball('default')
