  module Hellow

  def hellow
    puts "Дброго дня!!!"
  end

  def goodbye
    puts "Допобачення."
  end 

end
  
module Audit

  def fuel_count
    fuel_count = rand(100)
  end

  def  refuel_count
    refuel_count = 1+rand(99)
  end
end

class Driver
  attr_accessor :name

  include Hellow
  def initialaize
    @name = name
  end

  def say_hellow
    hellow
  end

  def answer(name)
    raise ArgumentError.new("Name must be String") unless name.respond_to?(:to_str)
    puts "Так, звісно перевірте"
    puts "Дякую #{name}."
  end  

  def say_goodbye
    goodbye
  end

  def actuation_machines
    puts 'Заводимо автомобіль.'
    puts 'Автомобіль заведено.'
  end

  def press_clutch_pedal
    puts 'Натискаємо педаль зчеплення.'
    puts 'Педаль зчеплення натиснута!'
  end

  def transmission
    puts 'Вимикаємо першу передачу.'
    puts 'Першу передачу ввімкнено.'  
  end

  def releaxse_clutch_pedal
    puts 'Відпускаєио педаль зчеплення.'
    puts 'Педаль зчеплення відпущено'
  end

  def press_gas
    puts 'Натискаємо педаль газу'
    puts 'Педальгазу натиснута'   
  end
end

class Checking_fuel
  attr_accessor :name

  include Hellow
  def initialaize
    @name = name
  end

  def say_hellow
    hellow
  end 

  def my_name(name)
    raise ArgumentError.new("Name must be String") unless name.respond_to?(:to_str)
    puts "Мене звати #{name}"
  end

  def question
    puts "Дозвольте перевірю рівень палива"
  end

  def say_goodbye
    goodbye
    puts ("Щасливої дороги.")
  end
end 

class Car
  attr_accessor :fuel_count
  
  def start
    puts 'Автомобіль можна заводити!' 
  end

  def run
    puts'Автомобіль їде'
  end
end

class AuditFuel

  def audit_fuel
  extend Audit  
    if fuel_count <= 100
      fuel = "Паливa  #{fuel_count}л з 100л, можна заводити автомобіль."
    else 
      fuel = "Палива  #{fuel_count}л !!! Потрібно заправити Автомобіль!"    
     
      refuel = "Автомобіль заправлено до #{refuel_count}л." 
    end
  puts fuel 
  puts refuel
  end 
end  

auditFuel = AuditFuel.new
car = Car.new
driver = Driver.new
checking_fuel = Checking_fuel.new

  driver.say_hellow
  checking_fuel.say_hellow

begin
  checking_fuel.my_name(123)
  checking_fuel.question
  driver.answer(2312) 
rescue Exception => e
  puts "Помилка"
  p e.message
  p e.backtrace
  puts "Write the name to String"
  name = gets
else 
  puts "If no exception, but never goes here"
ensure
  checking_fuel.my_name(name)
  checking_fuel.question
  driver.answer(name)
  auditFuel.audit_fuel
  checking_fuel.say_goodbye
  driver.say_goodbye
  car.start
  driver.actuation_machines
  driver.press_clutch_pedal
  driver.transmission
  driver.press_gas
  ar.run 
end