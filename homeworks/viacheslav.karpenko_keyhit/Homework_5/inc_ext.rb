puts ""
puts "Автомобільна фабрика демонструє паттерн BUILDER"

module GeneralCar

  def gathering_engine
    puts "Взяти деталі двигуна об'ємом #{@liters} літрів."
    puts "Зібрати головку блоку циліндрів."
    puts "Зібрати блок."
    puts "Встановити поршньову."
    puts "Закрити піддоном."
  end

  def gathering_car_body
    puts "Взяти елементи для автомобіля #{@type}."
    puts "З’єднати готові елементи точковою зваркою."
    puts "Пофарбувати."
  end

  def gathering_chassis
    puts "Встановити #{@whels} колеса на осі."
    puts "Встановити #{@dampers} амортизатори."
  end

end

module SpecialCar

  def driver_cabin
    puts "Зватити кабіну."
    puts "Встановити двері."
    puts "Встановити органи керування."
  end

  def vehicle_base
    puts "Нарізати #{@material} #{@material_form}."
    puts "Зігнути #{@material} #{@material_form}."
    puts "З’єднати #{@material_form} #{@connector}."
  end

end

module MaxWeightSpeed
  
  def hevy_vehicle_speed_max(m_speed)
    puts "При повні завантаженості вантажівка розвиває швидкість #{m_speed} км/год."
  end

end

class VehicleBuilder

attr_accessor :liters, :type, :whels, :dampers, :material, :material_form, :connector

  def initialize(liters = "", type = "", whels = 4, dampers = 4, material = "", material_form = "", connector = "")
    @liters = liters
    @type = type
    @whels = whels
    @dampers = dampers
    @material = material
    @material_form = material_form
    @connector = connector
  end

  include GeneralCar
  include SpecialCar
  extend MaxWeightSpeed

end

puts ""
puts ""
puts "__ Конвеєр автомобілів седан __"
puts ""

sedan_car = VehicleBuilder.new
puts "_ Двигун _"
sedan_car.liters = 1.5
sedan_car.gathering_engine
puts "_ Кузов _"
sedan_car.type = "Седан"
sedan_car.gathering_car_body
puts "_ Ходова _"
sedan_car.gathering_chassis

def sedan_car.speed(km_h) 
  puts "Автомобіль розвиває максимальну швидкість #{km_h} км/год."
end

sedan_car.speed(250)

puts " *  *  *"
puts ""
puts "__ Конвеєр автомобілів універсал __"
puts ""

universal_сar = VehicleBuilder.new(1.5, "універсал")
puts "_ Двигун _"
universal_сar.gathering_engine
puts "_ Кузов _"
universal_сar.gathering_car_body
puts "_ Ходова _"
universal_сar.gathering_chassis

puts " *  *  *"
puts ""
puts "__ Конвеєр вантажних автомобілів __"
puts ""

hevy_car = VehicleBuilder.new(5, "", 10, 6, "сталеві", "профілі", "заклепками")
puts "_ Кабіна _"
hevy_car.driver_cabin
puts "_ Рама _"
hevy_car.vehicle_base
puts "_ Двигун _"
hevy_car.gathering_engine
puts "_ Ходова _"
hevy_car.gathering_chassis
VehicleBuilder.hevy_vehicle_speed_max(80)

puts " *  *  *"
puts ""
puts "__ Конвеєр мотоциклів __"
puts ""

motorcycle = VehicleBuilder.new(0.5, "", 2, 4, "сталеві", "труби", "зваркою")
puts "_ Двигун _"
motorcycle.gathering_engine
puts "_ Рама _"
motorcycle.vehicle_base
puts "_ Ходова _"
motorcycle.gathering_chassis
puts "_ Додаткове обладнання _"

def motorcycle.custom_equipment
  puts "Встановити рацію."
  puts "Встановити стробоскопи."
  puts "Встановити сирену."
end

motorcycle.custom_equipment
