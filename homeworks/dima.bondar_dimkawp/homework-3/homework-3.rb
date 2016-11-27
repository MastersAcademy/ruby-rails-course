class FactoryBall
  attr_accessor :size, :textile, :color, :weigh

  def size_ball(size)
    case size
      when 1 .. 2
        puts 'little size'
      when 3 .. 4
        puts 'midle size'
      when 5 .. 6
        puts 'big size'
      else
        size = 5
        puts 'default size 5'
    end
    puts
    puts "SizeBall    - #{size}"
    puts '_______________________'
  end

  def textile_ball(textile)
    case textile
      when 'Composite leather'
        puts 'Composite leather'
      when 'Microfiber'
        puts 'Microfiber '
      when 'Polyurethane'
        puts 'Polyurethane'
      when 'Rubber'
        puts 'Rubber'
      else
        'Polyurethane default textile'
        puts 'default textile'
    end

    puts "TextileBall - #{textile}"
    puts '_______________________'
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

    puts "ColorBall    -#{color}"
    puts '_______________________'
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

    puts "WeighBall    -#{weigh}"
    puts '_______________________'

  end

end

new_ball = FactoryBall.new

class << new_ball

  def ball_name(name='default name')
    puts "Ball name - #{name}"
  end

end

class SoccerBall<FactoryBall

  def type_ball(type='soccer ball')
    puts type
  end

end

soccer_ball = SoccerBall.new

soccer_ball.type_ball
new_ball.ball_name
soccer_ball.size_ball (4)
soccer_ball.textile_ball('default')
soccer_ball.color_ball('default')
soccer_ball.weigh_ball('default')
