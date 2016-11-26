audit =
  class Audit_fuel

    def audit
      puts 'Перевірка наявності палива!'	
    end

    def audit_fuel (tank = 'повний')
  	
      if tank == 'повний'
        fuel = 'Паливо є, можна заводити автомобіль.'
      else 
        fuel = 'Палива немає!!!'
      end
    puts fuel 
    puts 
    end

  self
  end

a = audit.new

a.audit
a.audit_fuel

class Car

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
end

car = Car.new
car.actuation_machines
car.press_clutch_pedal
car.transmission