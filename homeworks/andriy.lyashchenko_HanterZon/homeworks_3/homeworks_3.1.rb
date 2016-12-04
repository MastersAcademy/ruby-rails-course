class Car
  def start_car
    puts 'Автомобіль можна заводити!'
    puts   
  end
  
  def actuation_machines
    puts 'Заводимо автомобіль.'
    puts
     puts 'Автомобіль заведено.'
    puts
  end

  def press_clutch_pedal
    puts 'Натискаємо педаль зчеплення.'
    puts
    puts 'Педаль зчеплення натиснута!'
    puts
  end

  def transmission
    puts 'Вимикаємо першу передачу.'
    puts
    puts 'Першу передачу ввімкнено.'
    puts  	
  end

  def releaxse_clutch_pedal
    puts 'Відпускаєио педаль зчеплення.'
    puts
    puts 'Педаль зчеплення відпущено'
    puts
  end

  def press_gas
    puts 'Натискаємо педаль газу'
    puts
    puts 'Педальгазу натиснута'
    puts  	
  end

  def run
    puts'Автомобіль їде'
  end
end

class AuditFuel
  attr_accessor :audit, :fuel_count

  def initialize(audit = 'Перевірка наявності палива!')
    @audit = audit
    puts @audit
    puts
    self  
  end

  def audit_fuel (fuel_count)  
    if fuel_count >= 1
      fuel = "Паливa  #{fuel_count}л з 100л, можна заводити автомобіль."
    else 
      fuel = "Палива  #{ fuel_count } !!! Потрібно заправити Автомобіль!"    
      def refuel
        fuel_count = 1+rand(99)
        refuel = "Автомобіль заправлено до #{fuel_count}л."
        
      end
    end
  puts fuel 
  puts 
  puts refuel
  puts
  end 
end  

auditFuel = AuditFuel.new
auditFuel.audit_fuel(0)


car = Car.new
car.start_car
car.actuation_machines
car.press_clutch_pedal
car.transmission
car.press_gas
car.run 