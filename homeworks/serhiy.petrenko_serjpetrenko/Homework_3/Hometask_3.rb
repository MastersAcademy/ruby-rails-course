#Предметна область: Оформлення закордонного паспорту Державною міграційною службою

class MigrationService #Державна міграційна служба

  attr_reader :first_name, :surname

  #Описано патерн "Information expert", ДМС, що володіє інфо-ю щодо вартості оформлення закордонного паспорту,
  # терміном оформлення та терміном отримання

  def initialize(first_name, surname)
    @first_name = first_name
    @surname = surname
  end

  def hello
    puts "Welcome to the migration service.Registration of passports will be cost - 256 UAH.\nThe deadline for registration is 30 days.\nYou can use cash machine service for paying?."
  end

  def cash_machine_way(first_name, surname)
    puts "#{first_name} #{surname} want to use cash machine for paying service"
  end

end

class Cash_machine_service

  attr_reader :check

  def initialize(check)
    @check = check
  end

  def second_initialize(first_name, surname)
    puts "You are welcome at cash machine service interface, registration just take 5 minutes"
    puts "Please enter your first name and surname"
    puts "#{first_name} #{surname}"
    puts 'Ok now you can pay for services'
  end

  #Метод, який описує роботу банкомату через, який проводиться оплата за оформлення паспорту.
  # Тут використовується патерн "Controller", банкомат є контролером ми даємо гроші банкомату, задля того, щоб отримати чек,
  # який буде посвідченням, оплати послуги оформлення

  def cash_machine(check)
    puts "Please insert money"
    a = gets.chomp
    if a.to_i == 256
      puts "Your payment was been succesfully"
    else
      puts "You need to pay 256 UAH"
    end
    puts "Now take your #{check} and go to the employee"
  end
end

class Employee

  def final(check, first_name, surname)
    puts "Good day #{first_name} #{surname}! Now you at the last stage of registration please give me your #{check} and take a photo it's just take a few minutes"
    puts "Congratulations your passport will be ready in 30 days"
  end
end

puts "Migration Service"
serj = MigrationService.new('Serj', 'Petrenko')
cms = Cash_machine_service.new('Check for payment')
serj.hello
serj.cash_machine_way('Serj', 'Petrenko')
puts "Start cash machine service"
cms.second_initialize('Serj', 'Petrenko')
cms.cash_machine('Check for payment')
puts "At the employee cabinet"
emp = Employee.new
emp.final('Check for payment','Serj', 'Petrenko')


