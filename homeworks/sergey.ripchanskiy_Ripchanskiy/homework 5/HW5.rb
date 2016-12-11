module Cashier_name
  def cashier(cashier_name)
    $manager_name = cashier_name
  end
end

module Welcome
  def hello(status, name)
    puts "Добрый день #{name}."" Меня зовут #{$manager_name}."
    puts "Вы хотите поучить или отправить посылку?"
    
    if status == "send"
      puts "Я бы хотел отправить посылку"
    else 
      puts "Я бы хотел получить посылку"
    end
  end
end

module Pay
  def pay(money)
    puts "С вас 10 грн за отправку"
    if money == 10
      puts "Вы дали #{money} гривен. Оплачено"
    elsif money >= 100
      puts "У вас не будет купюры поменьше. У меня не будет из #{money} грн сдачи."
    elsif money > 10
      a = money - 10
      puts "Вы дали #{money} грн. Возьмите, пожалуйста, сдачу, #{a} грн."
      puts "Хорошего дня!"
    else i = 10 - money
      puts "Пожалуйста, заплатите #{i} грн"
    end
  end
end


class Manager
  extend Cashier_name
end

class Sender
  include Welcome
  include Pay
end

class Reciplient
  include Welcome
end

Manager.cashier("Vlada")
sender1 = Sender.new
sender1.hello("send", "Sergey Ripchanskiy")
sender1.pay(11)
reciplient1 = Reciplient.new
reciplient1.hello("get", "Gopko Taras")

