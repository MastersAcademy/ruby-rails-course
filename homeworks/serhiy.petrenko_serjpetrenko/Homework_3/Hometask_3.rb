#Предметна область: Оформлення закордонного паспорту Державною міграційною службою

class MigrationService #Державна міграційна служба
  def hello
    puts "Welcome to the migration service.Registration of passports will be cost - 256 UAH.\nThe deadline for registration is 30 days.\nPlease going to the employee of Migration service for registration"
  end
  #Описано патерн "Information expert", ДМС, що володіє інфо-ю щодо вартості оформлення закордонного паспорту,
  # терміном оформлення та терміном отримання

end

class UserRegistration
  def registration
    puts "Please tell me what is your first name"
    first = gets.chomp
    puts "My name is #{first}"
    puts "Please tell me what is your second name"
    second = gets.chomp
    puts "My second name is #{second}"
    puts "Ok now going to the cash machine and pay for services"
  end


  #Метод, який описує роботу банкомату через, який проводиться оплата за оформлення паспорту.
     # Тут використовується патерн "Controller", банкомат є контролером ми даємо гроші банкомату, задля того, щоб отримати чек,
     # який буде посвідченням, оплати послуги оформлення

  def cash_machine
    puts "Please insert money"
    a = gets.chomp
    if a.to_i == 256
      puts "Your payment was been succesfully"
    else
      puts "You need to pay 256 UAH"
    end
    puts "Congratulations your passport will be ready in 30 days"
  end



end

class MigrationProcess 
  def run
    MigrationService.new.hello
    puts "Start registration"
    user_reg = UserRegistration.new
    user_reg.registration
    puts "Process of paying"
    user_reg.cash_machine
  end
end

MigrationProcess.new.run


