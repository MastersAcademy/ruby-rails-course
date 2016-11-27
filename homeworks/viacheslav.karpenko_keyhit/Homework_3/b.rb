puts ""
puts "Автомобільна фабрика демонструє паттерн BUILDER"

class VehicleBuilder

  def initialize(liters, type, whels = 4, dampers = 4 )
    @liters = liters
    @type = type
    @whels = whels
    @dampers = dampers
  end

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

class SpecialCarLine < VehicleBuilder

  def initialize(liters, whels = 4, dampers = 4, material, material_form, connector)
    @liters = liters
    @whels = whels
    @dampers = dampers
    @material = material
    @material_form = material_form
    @connector = connector
  end

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

puts ""
puts ""
puts "__ Конвеєр автомобілів седан __"
puts ""

sedanCar = VehicleBuilder.new(1.5, "ceдан")
puts "_ Двигун _"
sedanCar.gathering_engine
puts "_ Кузов _"
sedanCar.gathering_car_body
puts "_ Ходова _"
sedanCar.gathering_chassis

puts " *  *  *"
puts ""
puts "__ Конвеєр автомобілів універсал __"
puts ""

universalCar = VehicleBuilder.new(1.5, "універсал")
puts "_ Двигун _"
universalCar.gathering_engine
puts "_ Кузов _"
universalCar.gathering_car_body
puts "_ Ходова _"
universalCar.gathering_chassis

puts " *  *  *"
puts ""
puts "__ Конвеєр вантажних автомобілів __"
puts ""

hevyCar = SpecialCarLine.new(5, 10, 6, "сталеві", "профілі", "заклепками")
puts "_ Кабіна _"
hevyCar.driver_cabin
puts "_ Рама _"
hevyCar.vehicle_base
puts "_ Двигун _"
hevyCar.gathering_engine
puts "_ Ходова _"
hevyCar.gathering_chassis

 
puts " *  *  *"
puts ""
puts "__ Конвеєр мотоциклів __"
puts ""

motorcycle = SpecialCarLine.new(0.5, 2, 4, "сталеві", "труби", "зваркою")

class << motorcycle

  def custom_equipment
    puts "Встановити рацію."
    puts "Встановити стробоскопи."
    puts "Встановити сирену."
  end

end

puts "_ Двигун _"
motorcycle.gathering_engine
puts "_ Рама _"
motorcycle.vehicle_base
puts "_ Ходова _"
motorcycle.gathering_chassis
puts "_ Додаткове обладнання _"
motorcycle.custom_equipment
