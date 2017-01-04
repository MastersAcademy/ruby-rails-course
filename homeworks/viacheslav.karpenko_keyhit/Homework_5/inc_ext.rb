puts ""
puts "Автомобільна фабрика демонструє паттерн BUILDER"


#-- Modules --
module Engine
  
  def gathering_engine
    puts "Взяти деталі двигуна об'ємом #{@liters} літрів."
    puts "Зібрати головку блоку циліндрів."
    puts "Зібрати блок."
    puts "Встановити поршньову."
    puts "Закрити піддоном."
  end

end

module CarBody

  def gathering_car_body
    puts "Взяти елементи для автомобіля #{@type}."
    puts "З’єднати готові елементи точковою зваркою."
    puts "Пофарбувати."
  end

end

module Chassis
  
  def gathering_chassis
    puts "Встановити #{@whels} колеса на осі."
    puts "Встановити #{@dampers} амортизатори."
  end

end

module Cabin

  def driver_cabin
    puts "Зватити кабіну."
    puts "Встановити двері."
    puts "Встановити органи керування."
  end

end

module Base

  def vehicle_base
    puts "Нарізати #{@material} #{@material_form}."
    puts "Зігнути #{@material} #{@material_form}."
    puts "З’єднати #{@material_form} #{@connector}."
  end

end

module Color

  def paint(painting)
    puts "Фарбувати в #{painting} колір."
  end

end
#-- Classes --

class PassengerCar
  
  attr_accessor :liters, :type, :whels, :dampers

  def initialize(liters, type, whels, dampers)
    @liters = liters
    @type = type
    @whels = whels
    @dampers = dampers
  end
  
  include Engine
  include CarBody
  include Chassis
  extend Color

end

class Truck
  
  attr_accessor :liters, :whels, :dampers, :material, :material_form, :loading

  def initialize(liters = "", whels = "", dampers = "", material = "", material_form = "", loading = "")
    @liters = liters
    @whels = whels
    @dampers = dampers
    @material = material
    @material_form = material_form
    @loading = loading
  end
  
  include Engine
  include Cabin
  include Base
  include Chassis
  extend Color

  def max_load
    puts "Максимальна вага для перевезення #{@loading} кг."
  end

end

class Motorcycle
  
  attr_accessor :liters, :whels, :dampers, :material, :material_form

  def initialize(liters = "", whels = "", dampers = "", material = "", material_form = "")
    @liters = liters
    @whels = whels
    @dampers = dampers
    @material = material
    @material_form = material_form
  end
  
  include Engine
  include Base
  include Chassis
  extend Color

end

#-- Objects

puts""
puts"-- SEDAN car --"
sedan = PassengerCar.new(1.5, "седан", 4, 4)
puts "_ Двигун _"
sedan.gathering_engine
puts "_ Кузов _"
sedan.gathering_car_body
puts "_ Ходова _"
sedan.gathering_chassis
puts "_ Фарбування _"
PassengerCar.paint(" червоний ")
puts""

puts""
puts"-- UNIVERSAL car --"
universal = PassengerCar.new(1.5, "універсал",  4, 4)
puts "_ Двигун _"
universal.gathering_engine
puts "_ Кузов _"
universal.gathering_car_body
puts "_ Ходова _"
universal.gathering_chassis
puts "_ Фарбування _"
PassengerCar.paint(" зелений ")
puts""

puts""
puts"-- TRUCK --"
truck_vehi = Truck.new(5, 10, 6, "сталеві", "профілі")
puts "_ Двигун _"
truck_vehi.gathering_engine
truck_vehi.driver_cabin
puts "_ Рама _"
truck_vehi.vehicle_base
puts "_ Ходова _"
truck_vehi.gathering_chassis
puts "_ Фарбування _"
Truck.paint(" блакитний ")
puts "_ Максимальна вага _"
truck_vehi.loading = 3000
truck_vehi.max_load
puts""

puts""
puts"-- MOTORCYCLE --"
motor_byke = Motorcycle.new(1, "", "", "сталеві", "труби")
puts "_ Двигун _"
motor_byke.gathering_engine
puts "_ Рама _"
motor_byke.vehicle_base
puts "_ Ходова _"
motor_byke.whels = 2
motor_byke.dampers = 4
motor_byke.gathering_chassis
puts "_ Фарбування _"
Motorcycle.paint(" чорний ")
puts "_ Додаткове обладнання _"
def motor_byke.custom_equipment
  puts "Встановити рацію."
  puts "Встановити стробоскопи."
  puts "Встановити сирену."
end

motor_byke.custom_equipment
