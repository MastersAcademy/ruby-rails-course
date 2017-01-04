class Humen

  def hellow
    puts "Дброго дня!!!"
  end

  def goodbye
    puts "Допобачення."
  end
end

class Driver
   attr_accessor :name

  def initialaize
    @name = name
  end

  def say_hellow(hellow )
    hellow
  end

  def answer(name)
    puts "Так, звісно перевірте"
    puts "Дякую #{name}."
  end  

  def say_goodbye(goodbye)
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

  def initialaize
    @name = name
  end

  def say_hellow(hellow , name)
    hellow
    puts "Мене звати #{name}"
  end  

  def question
    puts "Дозвольте перевірю рівень палива"
  end

  def say_goodbye (goodbye)
    goodbye
    puts ("Щасливої дороги.")
  end
end 

class Car
  attr_accessor :fuel_count

  def initialize
    @fuel_count = fuel_count
  end

  def fuel_count
    @fuel_count = rand(100)
  end

  def  refuel_count
     refuel_count = 1+rand(99)
  end
  def start
    puts 'Автомобіль можна заводити!' 
  end

  def run
    puts'Автомобіль їде'
  end
end

class AuditFuel

  def audit_fuel (fuel_count ,refuel_count) 

    if fuel_count <= 100
      fuel = "Паливa  #{fuel_count}л з 100л, можна заводити автомобіль."
    else 
      fuel = "Палива  #{ fuel_count } !!! Потрібно заправити Автомобіль!"    
     
      refuel = "Автомобіль заправлено до #{refuel_count}л." 
    end
  puts fuel 
  puts refuel
  end 
end  

auditFuel = AuditFuel.new
car = Car.new
humen = Humen.new
driver = Driver.new
checking_fuel = Checking_fuel.new

driver.say_hellow(humen.hellow)
checking_fuel.say_hellow(humen.hellow, "Андій")
checking_fuel.question
driver.answer("Андрій")

auditFuel.audit_fuel(car.fuel_count, car.refuel_count)
checking_fuel.say_goodbye(humen.goodbye)
driver.say_goodbye(humen.goodbye)
car.start
driver.actuation_machines
driver.press_clutch_pedal
driver.transmission
driver.press_gas
car.run