module Subsystems
   
  # Turn the wheel 
  f_wheel = class Wheel

    def sybsys1
      "Subsystem Turn the wheel, Enabling power steering"
    end

    def sybsys2
      "Subsystem Turn the wheel, Invocation mechanism for turning wheels"
    end

    def sybsys3
      "Subsystem Turn the wheel, Turn the steering wheel stabilization system"
    end

    def sybsys4
      "Subsystem Turn the wheel, Enabling turn signal"
    end

  #Activate climate control
  class Climate

    def sybsys1
      "Subsystem Activate climate control, Turn temperature sensor"
    end

    def sybsys2
      "Subsystem Activate climate control, Analysis of mode selection"
    end

    def sybsys3
      "Subsystem Activate climate control, Invocation conditioner"
    end

    def sybsys4
      "Subsystem Activate climate control, Supply air ready"
    end

  end
   
end


# Facade - фасад
kia = class Car

  def initialize
    @sub_a = Subsystems::Wheel.new
    @sub_b = Subsystems::Climate.new 
  end

  def turn_w
    puts "Turn the wheel #{@sub_a.sybsys1} #{@sub_a.sybsys2} #{@sub_a.sybsys3} #{@sub_a.sybsys4}"
  end

  def activate_c
    puts "Activate climate control #{@sub_b.sybsys1} #{@sub_b.sybsys2} #{@sub_b.sybsys3} #{@sub_b.sybsys4}"
  end

end

facade = Car.new
facade.turn_w
facade.activate_c

kia.class_eval do

  def check
    puts "All systems are functioning properly"    
  end
  
end  

facade = Car.new
facade.turn_w
facade.activate_c
facade.check
